def merge_intervals(intervals: list[list[int]]) -> list[list[int]]:
    merged = [iv[:] for iv in intervals]  # copy so the input is not changed

    def overlaps(a: list[int], b: list[int]) -> bool:
        return a[0] <= b[1] and b[0] <= a[1]

    def find_overlapping_pair():
        for i in range(len(merged)):
            for j in range(i + 1, len(merged)):
                if overlaps(merged[i], merged[j]):
                    return i, j
        return None

    # keep merging any overlapping pair until no two intervals overlap
    pair = find_overlapping_pair()
    while pair is not None:
        i, j = pair
        merged[i] = [min(merged[i][0], merged[j][0]), max(merged[i][1], merged[j][1])]
        merged.pop(j)
        pair = find_overlapping_pair()

    return sorted(merged, key=lambda iv: iv[0])
