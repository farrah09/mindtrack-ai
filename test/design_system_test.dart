import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindtrack_ai/app/theme/app_theme.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations.dart';
import 'package:mindtrack_ai/core/l10n/generated/app_localizations_en.dart';
import 'package:mindtrack_ai/core/widgets/secondary_action_button.dart';
import 'package:mindtrack_ai/features/ai_coach/presentation/widgets/coach_message_bubble.dart';
import 'package:mindtrack_ai/features/habits/presentation/widgets/habit_preview_card.dart';
import 'package:mindtrack_ai/features/mood/presentation/widgets/mood_chip.dart';

Widget _harness(Widget child, {Brightness brightness = Brightness.light}) {
  return MaterialApp(
    theme: brightness == Brightness.light ? AppTheme.light() : AppTheme.dark(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  final l10n = AppLocalizationsEn();

  testWidgets('MoodChip shows a check icon and semantics when selected',
      (tester) async {
    await tester.pumpWidget(_harness(
      const MoodChip(label: 'Calm', icon: Icons.spa_outlined, selected: true),
    ));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check), findsOneWidget);
    final semantics = tester.getSemantics(find.byType(MoodChip));
    expect(semantics.hasFlag(SemanticsFlag.isSelected), isTrue);

    await tester.pumpWidget(_harness(
      const MoodChip(label: 'Calm', icon: Icons.spa_outlined),
    ));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.check), findsNothing);
  });

  testWidgets('HabitPreviewCard announces completion state', (tester) async {
    final semanticsHandle = tester.ensureSemantics();
    await tester.pumpWidget(_harness(
      const HabitPreviewCard(
        title: 'Morning walk',
        icon: Icons.directions_walk,
        completed: true,
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(
      find.bySemanticsLabel(l10n.habitCompletedSemantics),
      findsOneWidget,
    );

    await tester.pumpWidget(_harness(
      const HabitPreviewCard(
        title: 'Morning walk',
        icon: Icons.directions_walk,
      ),
    ));
    await tester.pumpAndSettle();
    expect(
      find.bySemanticsLabel(l10n.habitNotCompletedSemantics),
      findsOneWidget,
    );
    semanticsHandle.dispose();
  });

  testWidgets('CoachMessageBubble aligns and labels by sender', (tester) async {
    final semanticsHandle = tester.ensureSemantics();
    await tester.pumpWidget(_harness(
      const Column(
        children: [
          CoachMessageBubble(message: 'Hello'),
          CoachMessageBubble(message: 'Hi there', fromCoach: false),
        ],
      ),
    ));
    await tester.pumpAndSettle();

    final aligns = tester.widgetList<Align>(find.byType(Align)).toList();
    expect(
      aligns.map((a) => a.alignment),
      containsAll([Alignment.centerLeft, Alignment.centerRight]),
    );
    expect(
      find.bySemanticsLabel(RegExp(l10n.coachMessageSemantics)),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(RegExp(l10n.userMessageSemantics)),
      findsOneWidget,
    );
    semanticsHandle.dispose();
  });

  testWidgets('components render in dark theme', (tester) async {
    await tester.pumpWidget(_harness(
      brightness: Brightness.dark,
      const Column(
        children: [
          MoodChip(label: 'Calm', icon: Icons.spa_outlined, selected: true),
          HabitPreviewCard(
            title: 'Morning walk',
            icon: Icons.directions_walk,
            completed: true,
          ),
          CoachMessageBubble(message: 'Hello'),
          SecondaryActionButton(label: 'Not now'),
        ],
      ),
    ));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
