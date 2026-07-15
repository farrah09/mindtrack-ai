# Roadmap

Each commit is a reviewable, self-contained step. Order may shift slightly as the product takes shape.

## Commit 1 — Foundation (done)
- Flutter project, clean feature-first structure
- Material 3 light/dark theme with color/spacing/shape/typography tokens
- GoRouter with bottom-nav shell and all seven placeholder screens
- ARB-based string resources and `context.l10n` access
- Reusable widgets: AppScaffold, MindTrackCard, PrimaryActionButton, EmptyStateView, LoadingStateView, SectionHeader
- Docs: architecture, roadmap, ADR-001, UI generation prompt

## Commit 2 — Wellness design system foundation (done)
- `WellnessColors` theme extension (positive tones, chat bubble colors)
- Motion tokens (durations, curves, stagger) and animation helpers
- New reusable widgets: AppScreenContainer, SecondaryActionButton
- Feature placeholder components: MoodChip, HabitPreviewCard, CoachMessageBubble
- docs/design-system.md

## Commit 3 — Onboarding & home shell (this commit)
- Three-page onboarding flow: value proposition, page indicator, skip / get started
- Home shell: greeting, today overview, quick actions, honest feature entry cards, weekly reflection placeholder
- Onboarding-completed persistence intentionally deferred to the local persistence commit — the intro shows on every launch until then

## Commit 4 — Habits (domain + local state)
- Habit entity, repository contract, in-memory implementation
- Create/complete habits, habit list UI with real empty/loading states
- Habit completion animation

## Commit 5 — Mood check-ins
- Mood entity and repository contract
- Check-in flow with mood selection animation
- Recent check-ins on Home

## Commit 6 — Local persistence
- Hive or Isar behind existing repository contracts
- Onboarding-completed flag (skip onboarding on relaunch)

## Commit 7 — Mock AI coach
- Coach suggestion engine with canned, context-aware responses
- Chat-style UI with typing indicator
- Clear seam for a future backend-safe AI service

## Commit 8 — Analytics
- Habit streaks and mood trends from real local data
- Accessible charts (not color-only encoding)

## Commit 9 — Settings & polish
- Theme mode preference, data reset
- Page transition polish, screenshot pass for the README

## Later
- Backend-safe AI service (server-side keys, no secrets in the app)
- Notifications/reminders
- Additional locales
