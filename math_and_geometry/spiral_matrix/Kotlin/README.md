# Spiral Matrix — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Shrinking Boundaries — `1_boundaries.kt`

Keep four edges: `top`, `bottom`, `left`, and `right`. Walk the top edge from left to
right, then move `top` down one. Walk the right edge from top to bottom, then move
`right` in one. Do the bottom edge and the left edge the same way, in the other
directions. Each full lap peels one ring off the grid, so the walk never needs to
remember which cells it has used. The two `if` checks stop a single row or column from
being walked twice after the edges have crossed.

- Time: O(m · n), since every cell is read once
- Space: O(1) extra, not counting the output

## 2. Direction Walk with a Visited Grid — `2_direction_walk.kt`

Walk one cell at a time while keeping a direction: right, down, left, or up. Add the
current cell to the answer and mark it visited. If the next cell is off the grid or
already visited, turn clockwise once. A spiral only ever turns when it hits an edge or
its own path, so one turn is always enough. The walk stops after m · n steps.

- Time: O(m · n), one step per cell
- Space: O(m · n) for the visited grid, plus the output

## 3. Peel the Top Row, Rotate the Rest — `3_rotate_and_peel.kt`

Take the top row, add it to the answer, and remove it. Then rotate what is left 90°
counterclockwise. After that rotation, the old right column is now the top row, and it
is read top to bottom, which is exactly the order the spiral visits it. Repeat until
nothing is left. This is the least efficient version because every round rebuilds the
whole remaining grid, but it reuses one simple idea: rotate so the next edge is always
on top.

- Time: O(m² · n), since up to m rounds each rotate a grid of up to m · n cells
- Space: O(m · n) for the rotated copies (the input is not changed)
