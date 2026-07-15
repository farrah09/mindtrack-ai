import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindtrack_ai/app/mindtrack_app.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations_en.dart';
import 'package:mindtrack_ai/features/home/presentation/home_screen.dart';

void main() {
  final l10n = AppLocalizationsEn();

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MindTrackApp()));
    await tester.pumpAndSettle();
  }

  testWidgets('user can page through onboarding and finish', (tester) async {
    await pumpApp(tester);

    expect(find.text(l10n.onboardingHabitsTitle), findsOneWidget);
    expect(
      find.bySemanticsLabel(l10n.onboardingPageSemantics(1, 3)),
      findsOneWidget,
    );

    await tester.tap(find.text(l10n.onboardingNext));
    await tester.pumpAndSettle();
    expect(find.text(l10n.onboardingMoodTitle), findsOneWidget);
    expect(
      find.bySemanticsLabel(l10n.onboardingPageSemantics(2, 3)),
      findsOneWidget,
    );

    await tester.tap(find.text(l10n.onboardingNext));
    await tester.pumpAndSettle();
    expect(find.text(l10n.onboardingCoachTitle), findsOneWidget);
    expect(
      find.bySemanticsLabel(l10n.onboardingPageSemantics(3, 3)),
      findsOneWidget,
    );

    // Last page: "Next" becomes "Get started" and skip is gone.
    expect(find.text(l10n.onboardingNext), findsNothing);
    await tester.tap(find.text(l10n.onboardingGetStarted));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('skip goes straight to home', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text(l10n.onboardingSkip));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
