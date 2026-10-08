bool isValidSudoku(List<List<String>> board) {
  final rows = List.generate(9, (_) => <String>{});
  final cols = List.generate(9, (_) => <String>{});
  final boxes = List.generate(9, (_) => <String>{});
  for (var r = 0; r < 9; r++) {
    for (var c = 0; c < 9; c++) {
      final ch = board[r][c];
      if (ch == '.') continue;
      final b = (r ~/ 3) * 3 + c ~/ 3;
      if (!rows[r].add(ch) || !cols[c].add(ch) || !boxes[b].add(ch)) {
        return false;
      }
    }
  }
  return true;
}
