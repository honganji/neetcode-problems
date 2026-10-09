int longestCommonSubsequence(String text1, String text2) {
  final n = text2.length;
  final full = (BigInt.one << n) - BigInt.one;

  // For each letter, a bit mask of the positions where it appears in text2.
  final matchMasks = <String, BigInt>{};
  for (var j = 0; j < n; j++) {
    final c = text2[j];
    matchMasks[c] = (matchMasks[c] ?? BigInt.zero) | (BigInt.one << j);
  }

  // One bit per position in text2, all starting as 1.
  var v = full;
  for (final c in text1.split('')) {
    final u = v & (matchMasks[c] ?? BigInt.zero);
    v = ((v + u) | (v ^ u)) & full;
  }

  // Each 0 bit left in v counts one character of the LCS.
  final ones = v.toRadixString(2).replaceAll('0', '').length;
  return n - ones;
}
