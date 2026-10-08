List<List<String>> groupAnagrams(List<String> strs) {
  const a = 97; // 'a'

  List<int> letterCounts(String s) {
    final counts = List<int>.filled(26, 0);
    for (final unit in s.codeUnits) {
      counts[unit - a]++;
    }
    return counts;
  }

  bool sameCounts(List<int> x, List<int> y) {
    for (var i = 0; i < 26; i++) {
      if (x[i] != y[i]) return false;
    }
    return true;
  }

  final counts = strs.map(letterCounts).toList();
  final visited = List<bool>.filled(strs.length, false);
  final result = <List<String>>[];
  for (var i = 0; i < strs.length; i++) {
    if (visited[i]) continue;
    final group = <String>[strs[i]];
    visited[i] = true;
    for (var j = i + 1; j < strs.length; j++) {
      if (!visited[j] && sameCounts(counts[i], counts[j])) {
        group.add(strs[j]);
        visited[j] = true;
      }
    }
    result.add(group);
  }
  return result;
}
