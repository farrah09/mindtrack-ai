# Reusable UI generation prompt

Use this prompt when designing or generating any MindTrack AI screen or component.

---

Act as a senior Flutter product designer and mobile engineer.

Design a premium wellness-focused mobile UI for MindTrack AI.

Product feeling:
- Calm
- Helpful
- Human
- Trustworthy
- Modern
- Suitable for a senior mobile portfolio project

Visual style:
- Material 3
- Light and dark theme support
- Soft rounded cards
- Balanced spacing
- Clear typography
- Gentle wellness colors
- No clutter
- No generic template look
- No meaningless dashboard metrics

Animation requirements:
- Meaningful animations only
- Smooth screen transitions
- Subtle card entrance animations
- Habit completion animation when useful
- Mood selection animation when useful
- AI typing indicator for coach screen later
- Loading, empty, error, and success transitions
- Avoid flashy animations that do not support usability

Engineering requirements:
- Use reusable widgets
- Keep animations separate from business logic
- Use theme tokens for colors, spacing, typography, and shapes
- Avoid hardcoded repeated values
- Use resource files for visible user-facing text
- Support accessibility and readable text sizes
- Keep navigation simple and predictable
- Prefer maintainable code over visual tricks

Before implementing a screen:
1. Define UI state
2. Define empty/loading/error/success states
3. Use resource strings
4. Create reusable widgets when justified
5. Add preview/sample data only when useful
6. Keep the screen easy to navigate with one hand
