# Min Cost to Connect All Points — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Prim's algorithm (array version) — `1_prim.kt`

Start with one point in the network. Keep, for every outside point, the cheapest link to the network so far. Each round, add the outside point with the cheapest link, then update the links for the remaining outside points using the new point. The graph is complete (every pair can be linked), so scanning all points each round is cheap and needs no heap.

- Time: O(n²)
- Space: O(n)

## 2. Borůvka's algorithm — `2_boruvka.kt`

Treat every point as its own group. In each round, every group picks its cheapest link to a different group, and all of those links are added (skipping any that would form a loop). Each round at least halves the number of groups, so there are about log n rounds. Each round scans all pairs of points.

- Time: O(n² log n)
- Space: O(n)

## 3. Kruskal's algorithm — `3_kruskal.kt`

List every pair of points as a possible link and sort them by cost. Walk through the list from cheapest to most expensive, keeping a link only if it joins two groups that are not already connected (tracked with union-find). Stop after n - 1 links.

- Time: O(n² log n), dominated by sorting about n²/2 edges
- Space: O(n²) for the edge list
