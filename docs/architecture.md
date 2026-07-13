# Architecture

MindTrack AI uses Clean Architecture with a **feature-first** folder layout, kept deliberately lean: layers exist where they earn their keep, not preemptively.

## Layout

```
lib/
  main.dart                    # bootstrap: ProviderScope + runApp
  app/
    mindtrack_app.dart         # MaterialApp.router, themes, localization
    routing/
      app_router.dart          # GoRouter provider (routes + shell)
      app_routes.dart          # route path/name constants
      app_shell.dart           # bottom-navigation shell
    theme/
      app_theme.dart           # light/dark ThemeData builders
      app_colors.dart          # brand color tokens
      app_spacing.dart         # spacing tokens (4px grid)
      app_shapes.dart          # radius/shape tokens
      app_typography.dart      # text style overrides
  core/
    constants/                 # cross-cutting constants (e.g. motion durations)
    l10n/                      # ARB sources + generated AppLocalizations
    errors/                    # failure types (added when the data layer lands)
    utils/                     # shared helpers (added when needed)
    widgets/                   # reusable UI: AppScaffold, MindTrackCard, ...
  features/
    <feature>/
      presentation/            # screens, widgets, controllers (Riverpod)
      domain/                  # entities + repository contracts (habits/mood/ai_coach)
      data/                    # repository implementations, local storage
```

## Principles

- **Feature-first**: code is grouped by product feature, not by technical layer. Each feature owns its presentation (and later, domain and data) code.
- **Layers on demand**: `onboarding`, `home`, `analytics`, and `settings` currently only have `presentation/`. `habits`, `mood`, and `ai_coach` have `domain/` and `data/` scaffolded because they will own entities and persistence. No `BaseUseCase`/`BaseRepository` style abstractions.
- **Dependency direction**: presentation → domain ← data. Features do not import each other's internals; shared UI lives in `core/widgets`, app-level wiring in `app/`.
- **State management**: Riverpod. Today it provides the router; feature controllers (`Notifier`/`AsyncNotifier`) arrive with the first real feature.
- **Navigation**: GoRouter with a `StatefulShellRoute` — the five main tabs (Today, Habits, Mood, Coach, Insights) each keep their own navigation stack. Onboarding and Settings sit outside the shell.
- **Strings**: all user-visible text comes from ARB resources (`lib/core/l10n/app_en.arb`) via generated `AppLocalizations`, read through the `context.l10n` extension. Route names, enum values, and logs stay out of l10n.
- **Theming**: widgets read from `Theme.of(context)`; raw values live only in the token files under `app/theme/`.
- **Motion**: animation durations come from `AppDurations`; entrance animation respects the platform reduce-motion setting.

## Planned (not yet present, by design)

- Local persistence (Hive or Isar) behind repository interfaces in each feature's `domain/`
- Mock AI coach service first; a backend-safe AI service later (no API keys in the app)
- Feature controllers and real UI states (loading/empty/error/success) per screen
