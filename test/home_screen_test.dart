import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindtrack_ai/app/mindtrack_app.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations_en.dart';
import 'package:mindtrack_ai/features/ai_coach/presentation/ai_coach_screen.dart';
import 'package:mindtrack_ai/features/analytics/presentation/analytics_screen.dart';
import 'package:mindtrack_ai/features/habits/presentation/habits_screen.dart';
import 'package:mindtrack_ai/features/home/presentation/home_screen.dart';
import 'package:mindtrack_ai/features/mood/presentation/mood_screen.dart';

void main() {
  final l10n = AppLocalizationsEn();

  Future<void> pumpToHome(WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MindTrackApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.onboardingSkip));
    await tester.pumpAndSettle();
  }

  Future<void> tapOnHome(WidgetTester tester, String label) async {
    await tester.ensureVisible(find.text(label));
    await tester.pumpAndSettle();
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  Future<void> backToHome(WidgetTester tester) async {
    await tester.tap(find.text(l10n.navHome));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  }

  String expectedGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return l10n.homeGreetingMorning;
    if (hour < 17) return l10n.homeGreetingAfternoon;
    return l10n.homeGreetingEvening;
  }

  testWidgets('home shows greeting and honest placeholder sections',
      (tester) async {
    await pumpToHome(tester);

    expect(find.text(expectedGreeting()), findsOneWidget);
    expect(find.text(l10n.homeGreetingSubtitle), findsOneWidget);
    expect(find.text(l10n.homeTodayOverviewTitle), findsOneWidget);
    expect(find.text(l10n.homeHabitsPreviewTitle), findsOneWidget);
    expect(find.text(l10n.homeMoodCardTitle), findsOneWidget);
    expect(find.text(l10n.homeCoachPreviewMessage), findsOneWidget);
    expect(find.text(l10n.homeWeeklyReflectionTitle), findsOneWidget);
    expect(find.text(l10n.commonComingSoon), findsOneWidget);
  });

  testWidgets('quick actions open the matching tabs', (tester) async {
    await pumpToHome(tester);

    await tapOnHome(tester, l10n.homeActionAddHabit);
    expect(find.byType(HabitsScreen), findsOneWidget);
    await backToHome(tester);

    await tapOnHome(tester, l10n.homeActionMoodCheckIn);
    expect(find.byType(MoodScreen), findsOneWidget);
    await backToHome(tester);

    await tapOnHome(tester, l10n.homeActionAskCoach);
    expect(find.byType(AiCoachScreen), findsOneWidget);
    await backToHome(tester);

    await tapOnHome(tester, l10n.homeActionViewInsights);
    expect(find.byType(AnalyticsScreen), findsOneWidget);
    await backToHome(tester);
  });

  testWidgets('feature entry cards open the matching tabs', (tester) async {
    await pumpToHome(tester);

    await tapOnHome(tester, l10n.homeHabitsPreviewTitle);
    expect(find.byType(HabitsScreen), findsOneWidget);
    await backToHome(tester);

    await tapOnHome(tester, l10n.homeMoodCardTitle);
    expect(find.byType(MoodScreen), findsOneWidget);
    await backToHome(tester);

    await tapOnHome(tester, l10n.homeCoachPreviewMessage);
    expect(find.byType(AiCoachScreen), findsOneWidget);
    await backToHome(tester);
  });
}
