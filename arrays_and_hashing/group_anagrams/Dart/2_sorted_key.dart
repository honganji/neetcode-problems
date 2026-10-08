List<List<String>> groupAnagrams(List<String> strs) {
  final groups = <String, List<String>>{};
  for (final s in strs) {
    final sortedUnits = s.codeUnits.toList()..sort();
    final key = String.fromCharCodes(sortedUnits);
    groups.putIfAbsent(key, () => []).add(s);
  }
  return groups.values.toList();
}
