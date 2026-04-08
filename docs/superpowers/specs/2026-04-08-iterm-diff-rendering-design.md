# iTerm Diff Rendering Design

## Context

The Alien Romulus terminal theme is intentionally cyan-forward. In the current iTerm palette, the ANSI green slots are mapped to the same cyan family used for the default foreground. That works for general terminal output, but it weakens `git diff` rendering because added lines are not visually separated enough from normal text.

The current Emacs theme provides a better diff-reading experience because added and removed blocks are separated by background treatment as well as foreground color. The iTerm theme should move closer to that behavior without losing the theme's film-inspired phosphor look.

## Problem

Removed lines already pop because the red slot is clearly distinct from the default foreground. Added lines do not pop because:

- normal foreground is cyan-led
- ANSI green is also cyan-led
- added regions therefore read like ordinary terminal text instead of semantic diff content

## Goals

- Make added lines in terminal diffs read as a distinct semantic lane.
- Preserve the overall Alien Romulus palette and avoid a generic neon green terminal look.
- Use background contrast as a primary separator, similar to the Emacs/Magit treatment.
- Keep hunk headers and metadata secondary to add/remove semantics.

## Non-Goals

- Redesign the entire terminal palette.
- Make diff colors highly saturated or modern-looking at the expense of the retro display mood.
- Optimize for tools that ignore ANSI background colors completely.

## Approved Direction

Use a hybrid approach biased toward background-first separation:

- Keep normal terminal text cyan-led.
- Shift the ANSI green pair slightly away from cyan and toward phosphor green.
- Give added lines a darker moss/olive-style background block so additions read in chunks.
- Keep removed lines red-led, with the option to use a matching dark rust background if needed for parity.
- Leave hunk and metadata colors in a neutral or amber-adjacent role so they do not overpower the diff content.

## Design Details

### Added Lines

Added lines should no longer rely on cyan brightness alone. Their foreground should still feel native to the theme, but read clearly greener than the default text. The dominant readability improvement should come from the block background, which should be dark enough to frame the addition without flattening the glyphs.

### Removed Lines

Removed lines already have acceptable foreground separation. Background treatment can be adjusted to better match the weight of added blocks, but the red foreground does not need a major hue change.

### Overall Contrast Strategy

This design favors local contrast over global brightness. The goal is not to make additions brighter than everything else. The goal is to make them visually categorized at a glance while preserving the subdued CRT mood of the theme.

## Implementation Scope

Expected implementation work is limited to the iTerm color profile:

- update ANSI green values used by terminal diff additions
- update bright green values if needed for consistency
- tune any relevant background-facing slots involved in diff rendering behavior
- verify the result against real `git diff` output in iTerm

No Emacs theme changes are required as part of this task.

## Verification Criteria

- Added lines are immediately distinguishable from normal terminal text.
- Removed lines remain at least as readable as they are now.
- Added and removed blocks both feel intentional and balanced.
- The palette still reads as Alien Romulus rather than a generic green terminal theme.
