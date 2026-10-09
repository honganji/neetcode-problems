# Cheapest Flights Within K Stops — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Bellman-Ford with k + 1 rounds — `1_bellman_ford.dart`

Every round looks at every flight once and asks, "can this flight make the price to its destination cheaper?" Each round lets the trip grow by one more flight, so after `k + 1` rounds (k stops means k + 1 flights) every route within the limit has been checked. Each round reads the prices from the round before, so two flights can't be chained in the same round, which would sneak in an extra stop.

- Time: O(k · E), where E is the number of flights
- Space: O(n), where n is the number of cities

## 2. Dijkstra on (city, flights used) — `2_dijkstra.dart`

Dijkstra always expands the cheapest trip found so far. Plain Dijkstra on cities alone is not enough, because the cheapest route to a city may use too many flights. So each state is a pair (city, flights used), and each state keeps its own best price. The first time the destination comes off the queue, that price is the answer. Dart's core library has no priority queue, so the file includes a small heap.

- Time: O(k · E · log(k · E))
- Space: O(n · k + k · E)

## 3. DFS backtracking with pruning — `3_dfs_backtracking.dart`

Try every route from the source that uses at most k + 1 flights, and remember the cheapest one that reaches the destination. Stop exploring a route as soon as its cost already matches or beats the best answer found so far. This is easy to reason about and always correct, but the number of routes can grow exponentially with k, so it only works on small inputs.

- Time: O(d^(k+1)) in the worst case, where d is the most flights leaving any one city
- Space: O(k) for the recursion, plus O(n + E) for the graph
