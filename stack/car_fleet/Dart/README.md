# Car Fleet — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Sorted Stack — `1_sorted_stack.dart`

A car can only ever be slowed down by a car ahead of it, never by one behind,
so look at the cars from the one closest to the target backwards. For each
car work out how long it would take to reach the target on its own. Keep a
stack of fleet arrival times: if the current car's time is larger than the
time on top of the stack, it is slower than the fleet in front and will never
catch it, so it starts a new fleet and is pushed. If its time is smaller or
equal, it catches that fleet before the target and simply joins it, so nothing
is pushed. The stack size at the end is the number of fleets.

- Time: O(n log n) for the sort
- Space: O(n) for the sorted order and the stack

## 2. Sorted Running Max — `2_sorted_running_max.dart`

This is the same idea as the stack version with one observation: only the top
of the stack is ever read, and it always holds the slowest arrival time seen
so far. So replace the stack with a single `slowest` variable. Walking from
the front car backwards, a car starts a new fleet exactly when its own time is
greater than the slowest time so far; when that happens, count it and update
`slowest`. Otherwise it merges into the fleet ahead and is skipped.

- Time: O(n log n) for the sort
- Space: O(n) for the sorted order, O(1) extra beyond that

## 3. Brute Force — `3_bruteforce.dart`

Sort the cars front to back and compute every car's solo arrival time. A car
leads its own fleet precisely when no car ahead of it is slower, i.e. its time
is strictly greater than every time ahead of it. Instead of remembering that
maximum, rescan all the cars in front for each car and take the maximum
afresh. It gives the same answer but repeats work that the running-max
version does once.

- Time: O(n²)
- Space: O(n) for the sorted order and times
