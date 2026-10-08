bool isValidSudoku(List<List<String>> board) {
  final rows = List<int>.filled(9, 0);
  final cols = List<int>.filled(9, 0);
  final boxes = List<int>.filled(9, 0);
  const one = 49; // '1'
  for (var r = 0; r < 9; r++) {
    for (var c = 0; c < 9; c++) {
      final ch = board[r][c];
      if (ch == '.') continue;
      final bit = 1 << (ch.codeUnitAt(0) - one);
      final b = (r ~/ 3) * 3 + c ~/ 3;
      if (rows[r] & bit != 0 || cols[c] & bit != 0 || boxes[b] & bit != 0) {
        return false;
      }
      rows[r] |= bit;
      cols[c] |= bit;
      boxes[b] |= bit;
    }
  }
  return true;
}
