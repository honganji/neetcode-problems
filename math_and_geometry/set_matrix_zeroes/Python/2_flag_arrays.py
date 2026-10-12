def set_zeroes(matrix: list[list[int]]) -> None:
    m, n = len(matrix), len(matrix[0])
    zero_rows = [False] * m
    zero_cols = [False] * n

    # Record which rows and columns contain a zero.
    for i in range(m):
        for j in range(n):
            if matrix[i][j] == 0:
                zero_rows[i] = True
                zero_cols[j] = True

    # Clear every cell whose row or column was recorded.
    for i in range(m):
        for j in range(n):
            if zero_rows[i] or zero_cols[j]:
                matrix[i][j] = 0
