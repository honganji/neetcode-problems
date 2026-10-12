# Rotate Image — Dart

Solutions ordered from most to least efficient.

All three are O(n²) time. They differ in extra space and how many passes they make over the matrix. There are only three genuinely different techniques here, so all three are shown.

## 1. ⭐ Layer-by-layer cycle rotation — `1_layer_rotation.dart`

The matrix is a set of nested square rings. Rotating a ring by 90° just moves each value to the next spot in a cycle of four cells: top → right → bottom → left → top. Each step moves one such group of four, working from the outside ring inward. Every cell is touched once, and no extra memory is needed.

- Time: O(n²)
- Space: O(1)

## 2. Transpose, then reverse each row — `2_transpose_reverse.dart`

Swapping across the main diagonal (a transpose) turns rows into columns. Reversing each row after that gives the clockwise rotation. The work is split into two simple passes, so there are more swaps than in solution 1.

- Time: O(n²)
- Space: O(1)

## 3. Auxiliary matrix — `3_extra_matrix.dart`

Write each value straight into its rotated position in a new matrix, then copy the result back. It is easy to reason about, but it uses a second n × n grid. That breaks the "in place" requirement on LeetCode, so it is mainly useful as a baseline.

- Time: O(n²)
- Space: O(n²)
