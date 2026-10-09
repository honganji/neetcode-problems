bool checkInclusion(String s1, String s2) {
  if (s1.length > s2.length) {
    return false;
  }
  final target = String.fromCharCodes(s1.codeUnits.toList()..sort());
  for (var start = 0; start + s1.length <= s2.length; start++) {
    final units = s2.codeUnits.sublist(start, start + s1.length).toList()
      ..sort();
    if (String.fromCharCodes(units) == target) {
      return true;
    }
  }
  return false;
}
