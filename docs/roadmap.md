# Roadmap

Each commit is a reviewable, self-contained step. Order may shift slightly as the product takes shape.

## Commit 1 — Foundation (this commit)
- Flutter project, clean feature-first structure
- Material 3 light/dark theme with color/spacing/shape/typography tokens
- GoRouter with bottom-nav shell and all seven placeholder screens
- ARB-based string resources and `context.l10n` access
- Reusable widgets: AppScaffold, MindTrackCard, PrimaryActionButton, EmptyStateView, LoadingStateView, SectionHeader
- Docs: architecture, roadmap, ADR-001, UI generation prompt

## Commit 2 — Habits (domain + local state)
- Habit entity, repository contract, in-memory implementation
- Create/complete habits, habit list UI with real empty/loading states
- Habit completion animation

## Commit 3 — Mood check-ins
- Mood entity and repository contract
- Check-in flow with mood selection animation
- Recent check-ins on Home

## Commit 4 — Local persistence
- Hive or Isar behind existing repository contracts
- Onboarding-completed flag (skip onboarding on relaunch)

## Commit 5 — Mock AI coach
- Coach suggestion engine with canned, context-aware responses
- Chat-style UI with typing indicator
- Clear seam for a future backend-safe AI service

## Commit 6 — Analytics
- Habit streaks and mood trends from real local data
- Accessible charts (not color-only encoding)

## Commit 7 — Settings & polish
- Theme mode preference, data reset
- Page transition polish, screenshot pass for the README

## Later
- Backend-safe AI service (server-side keys, no secrets in the app)
- Notifications/reminders
- Additional locales
