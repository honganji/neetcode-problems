bool checkValidString(String s) {
  final openPositions = <int>[]; // indices of '(' that are not matched yet
  final starPositions = <int>[]; // indices of '*'
  for (var i = 0; i < s.length; i++) {
    final c = s[i];
    if (c == '(') {
      openPositions.add(i);
    } else if (c == '*') {
      starPositions.add(i);
    } else if (openPositions.isNotEmpty) {
      // Match ')' with a real '(' first, and save '*' for later.
      openPositions.removeLast();
    } else if (starPositions.isNotEmpty) {
      starPositions.removeLast();
    } else {
      return false;
    }
  }
  // Each leftover '(' needs a '*' after it to close it.
  while (openPositions.isNotEmpty && starPositions.isNotEmpty) {
    if (openPositions.removeLast() > starPositions.removeLast()) return false;
  }
  return openPositions.isEmpty;
}
