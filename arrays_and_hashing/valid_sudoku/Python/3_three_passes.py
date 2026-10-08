def is_valid_sudoku(board: list[list[str]]) -> bool:
    def has_duplicate(cells: list[str]) -> bool:
        seen = set()
        for ch in cells:
            if ch == ".":
                continue
            if ch in seen:
                return True
            seen.add(ch)
        return False

    for r in range(9):
        if has_duplicate(board[r]):
            return False
    for c in range(9):
        if has_duplicate([board[r][c] for r in range(9)]):
            return False
    for br in range(0, 9, 3):
        for bc in range(0, 9, 3):
            cells = [board[r][c] for r in range(br, br + 3) for c in range(bc, bc + 3)]
            if has_duplicate(cells):
                return False
    return True
