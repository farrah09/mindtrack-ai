# Design system

MindTrack AI's UI is built from a small set of tokens and reusable widgets. The goal is a calm, premium wellness feel that stays consistent as features land — without a heavyweight design framework.

## Theme tokens

All raw values live under `lib/app/theme/` and `lib/core/constants/`. Widgets never hardcode colors, spacing, radii, or durations.

| Token file | Contents |
| --- | --- |
| `app_colors.dart` | Brand seeds: calm teal-green primary, warm sand accent, soft light/dark surfaces. Material 3 `ColorScheme`s are derived from these — widgets read `Theme.of(context).colorScheme`. |
| `wellness_colors.dart` | `WellnessColors` `ThemeExtension` for tokens the M3 scheme lacks: positive/success greens (habit completion, upward trends) and coach/user chat bubble colors. Read via `context.wellnessColors`. |
| `app_spacing.dart` | 4px-grid spacing: `xs 4 · sm 8 · md 16 · lg 24 · xl 32 · xxl 48`, plus `screenPadding 20` for screen edges. |
| `app_shapes.dart` | Radii and shapes: `radiusSm 12` (buttons), `radiusMd 16` (cards), `radiusLg 24`, chip stadium shape, chat bubble corner radii. |
| `app_typography.dart` | Material 3 type scale with brand tweaks: semibold, slightly tightened headlines/titles; 1.5 line height on body text for longer coaching copy. |
| `app_durations.dart` | Motion tokens: `fast 150ms · medium 300ms · slow 500ms · stagger 60ms` and `AppCurves` (`enter`, `exit`, `standard`). |

Both themes (`AppTheme.light()` / `AppTheme.dark()`) come from the same seed so the app keeps one identity across brightness modes.

## Reusable widgets

Shared chrome lives in `lib/core/widgets/`; feature-specific components live in that feature's `presentation/widgets/`.

| Widget | Purpose |
| --- | --- |
| `AppScaffold` | Screen frame: app bar + safe area. |
| `AppScreenContainer` | Screen body: standard horizontal padding, stretched column, optional scrolling. |
| `MindTrackCard` | Rounded content card with themed shape/padding and optional tap ink. |
| `PrimaryActionButton` | Full-width filled CTA, optional icon. |
| `SecondaryActionButton` | Full-width outlined counterpart for less prominent actions. |
| `SectionHeader` | Section title with optional trailing action; marked as a header for assistive tech. |
| `EmptyStateView` | Icon + title + message + optional action for empty content. |
| `LoadingStateView` | Centered progress indicator with a localized, screen-reader-announced label. |
| `EntranceFade` | Fade/slide-up entrance; skipped when the OS reduce-motion setting is on. |
| `AnimatedPageSection` | Staggers `EntranceFade` across a screen's sections by index. |
| `StateTransitionSwitcher` | Standard cross-fade when a screen swaps UI states (loading → content). |
| `MoodChip` *(mood)* | Selectable mood pill; selection shown by border + check icon + semantics, not color alone. |
| `HabitPreviewCard` *(habits)* | Habit row with icon, title, subtitle, and animated completion indicator. |
| `CoachMessageBubble` *(ai_coach)* | Chat bubble; coach left / user right, sender announced to screen readers. |

The three feature components are placeholders: purely visual, the caller owns all state. They gain real data in later commits.

## Animation principles

- Motion must mean something: entrances orient, transitions explain a state change. No decorative loops.
- Timings and curves come from `AppDurations`/`AppCurves` — never inline values.
- Animation stays in dedicated widgets (`EntranceFade`, `StateTransitionSwitcher`), separate from business logic.
- Entrance motion respects the platform reduce-motion accessibility setting.

## Accessibility rules

- Meaningful controls get clear labels (from l10n); `Semantics` communicates selection and completion state.
- Decorative icons and duplicated visuals are wrapped in `ExcludeSemantics`.
- State is never conveyed by color alone — always paired with an icon, border, or label (e.g. habit completion check, mood chip border + check).
- Text uses the theme type scale and scales with system font size; body text keeps a comfortable 1.5 line height.

## Strings

- Every user-visible string — titles, labels, empty states, loading text, semantics labels — comes from `lib/core/l10n/app_en.arb` via `context.l10n`.
- Route names, enum values, keys, and logs are code identifiers and stay out of l10n.
- Components take localized text as parameters (or read `context.l10n` for their own fixed labels) so they stay locale-agnostic.
