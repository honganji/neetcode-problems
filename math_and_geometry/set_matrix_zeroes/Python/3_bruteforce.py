def set_zeroes(matrix: list[list[int]]) -> None:
    m, n = len(matrix), len(matrix[0])
    # Read zeros from an untouched copy, so the zeros we create don't spread further.
    original = [row[:] for row in matrix]

    for i in range(m):
        for j in range(n):
            if original[i][j] == 0:
                for c in range(n):
                    matrix[i][c] = 0
                for r in range(m):
                    matrix[r][j] = 0
