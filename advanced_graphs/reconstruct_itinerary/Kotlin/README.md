# Reconstruct Itinerary — Kotlin

Solutions ordered from most to least efficient. E is the number of tickets.

## 1. ⭐ Hierholzer's algorithm — `1_hierholzer.kt`

Think of the tickets as a map: each airport lists the places you can fly to. Always take the smallest unused destination. When you run out of options at an airport, that airport has to be the end of the trip from there, so write it down. The written-down airports come out in reverse order, so flip the list at the end. A loop of flights can get you stuck early, but the airports on that loop are written down before the rest of the trip and end up in the right place after the flip.

- Time: O(E log E)
- Space: O(E)

The sorting dominates; each ticket is then used once.

## 2. Backtracking DFS — `2_backtracking.kt`

Walk the tickets depth-first and always try the smallest destination first. If every ticket gets used, you are done. Because smaller airports were tried first, this first complete trip is the smallest possible one. If you get stuck before using all tickets, put the last ticket back and try the next option.

- Time: O(E!) in the worst case (exponential)
- Space: O(E)

Usually fast, but it can explore many dead ends before finding the answer. The worst case grows exponentially with the number of tickets.

## 3. Brute force over all ticket orders — `3_bruteforce.kt`

Try every possible order of the tickets. For each order, check whether each ticket starts where the previous one ended and the trip starts at JFK. Among all valid orders, keep the smallest. This is easy to reason about, but there are E! orders, so it only works for a handful of tickets.

- Time: O(E! * E)
- Space: O(E)
