# ADR-001: Architecture and core libraries

- **Status**: Accepted
- **Date**: 2026-07-12

## Context

MindTrack AI is a portfolio-grade habit and mood coach that will grow feature by feature: local-first data, a mock AI coach evolving into a backend-safe AI service, and analytics. The foundation must support that growth without over-engineering the first commits.

## Decision

1. **Clean Architecture, feature-first, layers on demand.** Code is organized by feature (`features/habits`, `features/mood`, …) with `presentation/domain/data` inside a feature only where that feature will own business rules and persistence. Presentation-only features (home, analytics, settings, onboarding) get just `presentation/`. No generic `BaseUseCase`/`BaseRepository` abstractions.

2. **Riverpod for state management and DI.** Compile-safe providers, testable without a widget tree, and no service-locator globals. It already carries the router provider and will carry feature controllers (`Notifier`/`AsyncNotifier`).

3. **GoRouter for navigation.** Declarative routes, deep-link ready, and `StatefulShellRoute` gives per-tab navigation stacks for the bottom bar — the standard, Flutter-team-maintained choice.

4. **ARB string resources from day one** via Flutter's built-in `gen_l10n`. All user-visible text comes from `AppLocalizations`; adding a locale later is a file drop, not a refactor.

5. **Theme tokens over inline values.** Colors, spacing, shapes, typography, and motion durations live in token files; widgets read from `Theme.of(context)`.

6. **Mock-first AI, local-first data.** No AI API calls and no database in the foundation. Repository contracts (later commits) form the seam where Hive/Isar and a backend-safe AI service plug in.

## Consequences

- New features follow one obvious recipe: screen → controller → repository contract → implementation.
- Some scaffolded `data/`/`domain/` folders are empty until their feature lands (kept with `.gitkeep`) — acceptable, they document intent.
- Riverpod and GoRouter versions are pinned to the latest compatible with the current stable SDK (Flutter 3.24 / Dart 3.5); upgrading Flutter later unlocks newer majors.
- Using built-in `gen_l10n` (not a third-party i18n package) keeps dependencies minimal; generated output is git-ignored and rebuilt by the tool.
