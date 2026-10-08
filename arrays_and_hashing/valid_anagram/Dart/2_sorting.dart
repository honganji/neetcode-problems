bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;
  final a = s.codeUnits.toList()..sort();
  final b = t.codeUnits.toList()..sort();
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
