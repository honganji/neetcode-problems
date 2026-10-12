List<int> spiralOrder(List<List<int>> matrix) {
  final result = <int>[];
  var rows = matrix;
  while (rows.isNotEmpty) {
    result.addAll(rows.first);
    final rest = rows.sublist(1);
    if (rest.isEmpty) break;
    // Rotate counterclockwise: the last column becomes the new top row.
    rows = [
      for (var col = 0; col < rest[0].length; col++)
        [for (final row in rest) row[col]],
    ].reversed.toList();
  }
  return result;
}
