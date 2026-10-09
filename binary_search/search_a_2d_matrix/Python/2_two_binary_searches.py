def search_matrix(matrix: list[list[int]], target: int) -> bool:
    top, bottom = 0, len(matrix) - 1
    while top <= bottom:
        mid = (top + bottom) // 2
        if target < matrix[mid][0]:
            bottom = mid - 1
        elif target > matrix[mid][-1]:
            top = mid + 1
        else:
            break
    if top > bottom:
        return False
    row = matrix[(top + bottom) // 2]
    left, right = 0, len(row) - 1
    while left <= right:
        mid = (left + right) // 2
        if row[mid] == target:
            return True
        if row[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return False
