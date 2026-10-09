bool checkValidString(String s) {
  // lo and hi are the fewest and most '(' that could still be open so far.
  var lo = 0;
  var hi = 0;
  for (var i = 0; i < s.length; i++) {
    final c = s[i];
    if (c == '(') {
      lo++;
      hi++;
    } else if (c == ')') {
      lo--;
      hi--;
    } else {
      // '*' can close one '(' (lo - 1), open one (hi + 1), or be empty.
      lo--;
      hi++;
    }
    // Even treating every '*' as '(' there is no '(' left for a ')'.
    if (hi < 0) return false;
    if (lo < 0) lo = 0; // a '*' can always be empty, so lo never goes below 0
  }
  return lo == 0;
}
