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

  testWidgets('user can reach every placeholder screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MindTrackApp()));
    await tester.pumpAndSettle();

    // Onboarding → Home.
    await tester.tap(find.text(l10n.onboardingGetStarted));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);

    // Bottom navigation tabs.
    await tester.tap(find.text(l10n.navHabits));
    await tester.pumpAndSettle();
    expect(find.byType(HabitsScreen), findsOneWidget);

    await tester.tap(find.text(l10n.navMood));
    await tester.pumpAndSettle();
    expect(find.byType(MoodScreen), findsOneWidget);

    await tester.tap(find.text(l10n.navCoach));
    await tester.pumpAndSettle();
    expect(find.byType(AiCoachScreen), findsOneWidget);

    await tester.tap(find.text(l10n.navAnalytics));
    await tester.pumpAndSettle();
    expect(find.byType(AnalyticsScreen), findsOneWidget);

    // Home → Settings and back.
    await tester.tap(find.text(l10n.navHome));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
