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
  var matches = 0;
  for (var i = 0; i < 26; i++) {
    if (need[i] == window[i]) {
      matches++;
    }
  }
  for (var right = s1.length; right < s2.length; right++) {
    if (matches == 26) {
      return true;
    }
    final enter = s2.codeUnitAt(right) - a;
    window[enter]++;
    if (window[enter] == need[enter]) {
      matches++;
    } else if (window[enter] == need[enter] + 1) {
      matches--;
    }
    final leave = s2.codeUnitAt(right - s1.length) - a;
    window[leave]--;
    if (window[leave] == need[leave]) {
      matches++;
    } else if (window[leave] == need[leave] - 1) {
      matches--;
    }
  }
  return matches == 26;
}
