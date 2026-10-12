def spiral_order(matrix: list[list[int]]) -> list[int]:
    result = []
    rows = [list(row) for row in matrix]  # copy so the input is not changed
    while rows:
        result.extend(rows.pop(0))
        # Rotate counterclockwise: the last column becomes the new top row.
        rows = [list(col) for col in zip(*rows)][::-1]
    return result
