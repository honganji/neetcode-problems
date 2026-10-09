def merge_intervals(intervals: list[list[int]]) -> list[list[int]]:
    if not intervals:
        return []
    # Double every coordinate: point x is cell 2x, the gap (x, x+1) is cell 2x+1.
    # Then [1, 4] and [4, 5] touch (no gap cell), but [1, 4] and [5, 6] do not.
    limit = 2 * max(end for _, end in intervals) + 2
    diff = [0] * (limit + 1)
    for start, end in intervals:
        diff[2 * start] += 1      # coverage begins at this cell
        diff[2 * end + 1] -= 1    # and stops right after this interval's last cell

    merged = []
    covered = 0       # how many intervals cover the current cell
    open_start = -1   # first cell of the run we are currently inside, or -1
    for cell in range(limit):
        covered += diff[cell]
        if covered > 0 and open_start == -1:
            open_start = cell
        elif covered == 0 and open_start != -1:
            merged.append([open_start // 2, (cell - 1) // 2])
            open_start = -1
    return merged
