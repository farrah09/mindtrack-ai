import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindtrack_ai/app/mindtrack_app.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations_en.dart';
import 'package:mindtrack_ai/features/ai_coach/presentation/ai_coach_screen.dart';
import 'package:mindtrack_ai/features/analytics/presentation/analytics_screen.dart';
import 'package:mindtrack_ai/features/habits/presentation/habits_screen.dart';
import 'package:mindtrack_ai/features/home/presentation/home_screen.dart';
import 'package:mindtrack_ai/features/mood/presentation/mood_screen.dart';
import 'package:mindtrack_ai/features/settings/presentation/settings_screen.dart';

void main() {
  final l10n = AppLocalizationsEn();

  // Home sections reuse some tab names ("Habits", "Mood", "Coach"), so
  // nav taps are scoped to the navigation bar.
  Future<void> tapTab(WidgetTester tester, String label) async {
    await tester.tap(find.descendant(
      of: find.byType(NavigationBar),
      matching: find.text(label),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('user can reach every placeholder screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MindTrackApp()));
    await tester.pumpAndSettle();

    // Onboarding → Home (via skip).
    await tester.tap(find.text(l10n.onboardingSkip));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);

    // Bottom navigation tabs.
    await tapTab(tester, l10n.navHabits);
    expect(find.byType(HabitsScreen), findsOneWidget);

    await tapTab(tester, l10n.navMood);
    expect(find.byType(MoodScreen), findsOneWidget);

    await tapTab(tester, l10n.navCoach);
    expect(find.byType(AiCoachScreen), findsOneWidget);

    await tapTab(tester, l10n.navAnalytics);
    expect(find.byType(AnalyticsScreen), findsOneWidget);

    // Home → Settings and back.
    await tapTab(tester, l10n.navHome);
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
