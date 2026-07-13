# MindTrack AI

An AI-powered habit and mood coach built with Flutter. Track daily habits, check in with your mood, and receive supportive, human-sounding coaching suggestions — all in a calm, premium wellness UI.

> Portfolio project. Built with a production mindset: clean architecture, localized strings, theme tokens, accessibility, and meaningful animation — no fake dashboards or placeholder-quality code left behind.

## Features (planned)

- **Habit tracking** — create habits and build streaks one day at a time
- **Mood check-ins** — quick, low-friction daily mood logging
- **AI coach** — supportive suggestions based on your habits and moods (mock-first, backend-safe AI service later)
- **Insights** — habit and mood trends over time
- **Local-first** — your data stays on the device (Hive/Isar planned)

## Screenshots

Placeholders — real captures land as each feature ships.

| Onboarding | Home | Habits |
| :---: | :---: | :---: |
| ![Onboarding](docs/screenshots/01-onboarding.png) | ![Home](docs/screenshots/02-home.png) | ![Habits](docs/screenshots/03-habits.png) |

| Mood Check-in | AI Coach | Insights |
| :---: | :---: | :---: |
| ![Mood check-in](docs/screenshots/04-mood-checkin.png) | ![AI coach](docs/screenshots/05-ai-coach.png) | ![Analytics](docs/screenshots/06-analytics.png) |

## Tech stack

- Flutter (Material 3) / Dart
- [Riverpod](https://pub.dev/packages/flutter_riverpod) — state management and dependency injection
- [GoRouter](https://pub.dev/packages/go_router) — declarative navigation with a stateful bottom-nav shell
- Flutter `gen_l10n` — ARB-based string resources from day one
- Clean Architecture with a feature-first folder layout

See [docs/architecture.md](docs/architecture.md) and [docs/decisions/ADR-001-architecture.md](docs/decisions/ADR-001-architecture.md) for details, and [docs/roadmap.md](docs/roadmap.md) for what's next.

## Getting started

```sh
flutter pub get
flutter run
```

Localized strings are generated from `lib/core/l10n/app_en.arb` automatically on `flutter pub get` / `flutter run` (or manually with `flutter gen-l10n`).

## Project structure

```
lib/
  main.dart            # entry point
  app/                 # app shell: root widget, routing, theme tokens
  core/                # shared: l10n, constants, reusable widgets
  features/            # feature-first modules (presentation / domain / data)
```
