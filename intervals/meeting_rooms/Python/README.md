# Meeting Rooms — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Sort and Compare Neighbors — `1_sorting.py`

Sort the meetings by start time. Once they are in order, any clash shows up
between two neighbors: a meeting starts before the one just before it has ended.
So a single pass over the sorted list is enough to decide the answer.

- Time: O(n log n), dominated by the sort
- Space: O(n) for the sorted copy

## 2. Difference Array (Sweep Over Time) — `2_difference_array.py`

Mark each meeting on a timeline: +1 where it starts and −1 where it ends. Then walk
the timeline with a running count of meetings in progress. If that count ever reaches
2, two meetings overlap. There is no sorting, but the timeline is as long as the latest
end time, so this only makes sense when the times are bounded (here they are at most 10^6).

- Time: O(n + M), where M is the latest end time
- Space: O(M) for the timeline array

## 3. Pairwise Check (Brute Force) — `3_bruteforce.py`

Compare every pair of meetings. Two meetings overlap exactly when each one starts
before the other ends. This needs no ordering and is easy to trust, but the number
of pairs grows with the square of the number of meetings.

- Time: O(n²)
- Space: O(1)
