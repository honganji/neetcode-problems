bool checkInclusion(String s1, String s2) {
  if (s1.length > s2.length) {
    return false;
  }
  final a = 'a'.codeUnitAt(0);
  final need = List<int>.filled(26, 0);
  final window = List<int>.filled(26, 0);
  for (var i = 0; i < s1.length; i++) {
    need[s1.codeUnitAt(i) - a]++;
    window[s2.codeUnitAt(i) - a]++;
  }
  bool same() {
    for (var i = 0; i < 26; i++) {
      if (need[i] != window[i]) {
        return false;
      }
    }
    return true;
  }

  if (same()) {
    return true;
  }
  for (var right = s1.length; right < s2.length; right++) {
    window[s2.codeUnitAt(right) - a]++;
    window[s2.codeUnitAt(right - s1.length) - a]--;
    if (same()) {
      return true;
    }
  }
  return false;
}
