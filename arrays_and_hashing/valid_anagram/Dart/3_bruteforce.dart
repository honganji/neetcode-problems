bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;
  final remaining = t.split('');
  for (final ch in s.split('')) {
    final index = remaining.indexOf(ch);
    if (index == -1) return false;
    remaining.removeAt(index);
  }
  return true;
}
