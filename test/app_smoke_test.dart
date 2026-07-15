import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindtrack_ai/app/mindtrack_app.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations_en.dart';
import 'package:mindtrack_ai/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  testWidgets('app boots to the onboarding screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MindTrackApp()));
    await tester.pumpAndSettle();

    final l10n = AppLocalizationsEn();
    expect(find.byType(OnboardingScreen), findsOneWidget);
    expect(find.text(l10n.onboardingHabitsTitle), findsOneWidget);
    expect(find.text(l10n.onboardingSkip), findsOneWidget);
    expect(find.text(l10n.onboardingNext), findsOneWidget);
  });
}
