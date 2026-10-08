List<List<String>> groupAnagrams(List<String> strs) {
  final groups = <String, List<String>>{};
  const a = 97; // 'a'
  for (final s in strs) {
    final counts = List<int>.filled(26, 0);
    for (final unit in s.codeUnits) {
      counts[unit - a]++;
    }
    final key = counts.join(',');
    groups.putIfAbsent(key, () => []).add(s);
  }
  return groups.values.toList();
}
