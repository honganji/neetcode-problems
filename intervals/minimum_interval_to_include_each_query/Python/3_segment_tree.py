from bisect import bisect_left, bisect_right


def minInterval(intervals: list[list[int]], queries: list[int]) -> list[int]:
    # Each interval "paints" the compressed query positions it covers with its size,
    # keeping the minimum. Painting is a range update; reading a query is a point read.
    sorted_queries = sorted(set(queries))
    m = len(sorted_queries)
    INF = 1 << 30
    tree = [INF] * (2 * m)  # bottom-up segment tree; leaves are at m..2m-1

    for left, right in intervals:
        size = right - left + 1
        lo = bisect_left(sorted_queries, left) + m
        hi = bisect_right(sorted_queries, right) + m  # exclusive
        while lo < hi:
            if lo & 1:
                tree[lo] = min(tree[lo], size)
                lo += 1
            if hi & 1:
                hi -= 1
                tree[hi] = min(tree[hi], size)
            lo >>= 1
            hi >>= 1

    answer = []
    for q in queries:
        # Walk from the leaf up to the root; the best size painted on the path wins.
        p = bisect_left(sorted_queries, q) + m
        best = INF
        while p >= 1:
            best = min(best, tree[p])
            p >>= 1
        answer.append(best if best != INF else -1)
    return answer
