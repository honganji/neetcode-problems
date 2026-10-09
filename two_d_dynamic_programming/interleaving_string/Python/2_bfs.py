from collections import deque


def is_interleave(s1: str, s2: str, s3: str) -> bool:
    m, n = len(s1), len(s2)
    if m + n != len(s3):
        return False

    # A state (i, j) means s1[:i] and s2[:j] have been used up to s3[:i + j].
    # Start at (0, 0) and move one step at a time to reach (m, n).
    queue = deque([(0, 0)])
    seen = {(0, 0)}
    while queue:
        i, j = queue.popleft()
        if i == m and j == n:
            return True
        k = i + j
        if i < m and s1[i] == s3[k] and (i + 1, j) not in seen:
            seen.add((i + 1, j))
            queue.append((i + 1, j))
        if j < n and s2[j] == s3[k] and (i, j + 1) not in seen:
            seen.add((i, j + 1))
            queue.append((i, j + 1))
    return False
