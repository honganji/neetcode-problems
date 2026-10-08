bool isValidSudoku(List<List<String>> board) {
  bool hasDuplicate(Iterable<String> cells) {
    final seen = <String>{};
    for (final ch in cells) {
      if (ch == '.') continue;
      if (!seen.add(ch)) return true;
    }
    return false;
  }

  for (var r = 0; r < 9; r++) {
    if (hasDuplicate(board[r])) return false;
  }
  for (var c = 0; c < 9; c++) {
    if (hasDuplicate(List.generate(9, (r) => board[r][c]))) return false;
  }
  for (var br = 0; br < 9; br += 3) {
    for (var bc = 0; bc < 9; bc += 3) {
      final cells = <String>[];
      for (var r = br; r < br + 3; r++) {
        for (var c = bc; c < bc + 3; c++) {
          cells.add(board[r][c]);
        }
      }
      if (hasDuplicate(cells)) return false;
    }
  }
  return true;
}
