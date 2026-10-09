from bisect import bisect_left


def minInterval(intervals: list[list[int]], queries: list[int]) -> list[int]:
    # Handle the smallest intervals first. Each query is answered by the first
    # interval that covers it, and a "next unanswered" pointer skips finished queries.
    sorted_queries = sorted(set(queries))
    m = len(sorted_queries)
    parent = list(range(m + 1))  # parent[m] is a sentinel meaning "past the end"

    def find(x: int) -> int:
        while parent[x] != x:
            parent[x] = parent[parent[x]]  # path halving
            x = parent[x]
        return x

    best: dict[int, int] = {}
    for left, right in sorted(intervals, key=lambda iv: iv[1] - iv[0]):
        size = right - left + 1
        j = find(bisect_left(sorted_queries, left))
        while j < m and sorted_queries[j] <= right:
            best[sorted_queries[j]] = size
            parent[j] = j + 1  # mark answered; skip it from now on
            j = find(j + 1)
    return [best.get(q, -1) for q in queries]
