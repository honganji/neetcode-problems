bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;
  final counts = List<int>.filled(26, 0);
  const a = 97; // 'a'
  for (var i = 0; i < s.length; i++) {
    counts[s.codeUnitAt(i) - a]++;
    counts[t.codeUnitAt(i) - a]--;
  }
  return counts.every((c) => c == 0);
}
