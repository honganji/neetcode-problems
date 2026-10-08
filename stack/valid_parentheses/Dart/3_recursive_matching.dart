bool isValid(String s) {
  const pairs = {'(': ')', '[': ']', '{': '}'};

  int parse(int i) {
    if (i >= s.length || !pairs.containsKey(s[i])) {
      return -1;
    }
    final closing = pairs[s[i]];
    i++;
    while (i < s.length && s[i] != closing) {
      i = parse(i);
      if (i == -1) {
        return -1;
      }
    }
    return i < s.length ? i + 1 : -1;
  }

  var i = 0;
  while (i < s.length) {
    i = parse(i);
    if (i == -1) {
      return false;
    }
  }
  return true;
}
