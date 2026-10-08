List<String> generateParenthesis(int n) {
  final table = <List<String>>[
    ['']
  ];
  for (var size = 1; size <= n; size++) {
    final combos = <String>[];
    for (var inner = 0; inner < size; inner++) {
      for (final left in table[inner]) {
        for (final right in table[size - 1 - inner]) {
          combos.add('($left)$right');
        }
      }
    }
    table.add(combos);
  }
  return table[n];
}
