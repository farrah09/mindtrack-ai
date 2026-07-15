import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routing/app_routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/entrance_fade.dart';
import '../../../core/widgets/primary_action_button.dart';
import 'widgets/onboarding_page_indicator.dart';

/// First-run introduction: three swipeable value-proposition pages.
///
/// "Get started" and "Skip" both lead to home. The completed flag is not
/// persisted yet — that lands with the local persistence commit, so the
/// intro currently shows on every launch.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _pageCount = 3;

  final PageController _controller = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == _pageCount - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finish() => context.goNamed(AppRoutes.homeName);

  void _next() {
    _controller.nextPage(
      duration: AppDurations.slow,
      curve: AppCurves.enter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: EntranceFade(
          child: AppScreenContainer(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: AnimatedOpacity(
                  duration: AppDurations.fast,
                  opacity: _isLastPage ? 0 : 1,
                  child: IgnorePointer(
                    ignoring: _isLastPage,
                    child: ExcludeSemantics(
                      excluding: _isLastPage,
                      child: TextButton(
                        onPressed: _finish,
                        child: Text(l10n.onboardingSkip),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (page) =>
                      setState(() => _currentPage = page),
                  children: [
                    _OnboardingPage(
                      icon: Icons.check_circle_outline,
                      title: l10n.onboardingHabitsTitle,
                      body: l10n.onboardingHabitsBody,
                    ),
                    _OnboardingPage(
                      icon: Icons.sentiment_satisfied_outlined,
                      title: l10n.onboardingMoodTitle,
                      body: l10n.onboardingMoodBody,
                    ),
                    _OnboardingPage(
                      icon: Icons.self_improvement,
                      title: l10n.onboardingCoachTitle,
                      body: l10n.onboardingCoachBody,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              OnboardingPageIndicator(
                pageCount: _pageCount,
                currentPage: _currentPage,
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryActionButton(
                label: _isLastPage
                    ? l10n.onboardingGetStarted
                    : l10n.onboardingNext,
                onPressed: _isLastPage ? _finish : _next,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

/// One onboarding page: illustration circle, title, and body copy.
class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;

  final String title;

  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExcludeSemantics(
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 48,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          title,
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          body,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
