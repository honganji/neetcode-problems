String encode(List<String> strs) {
  final buffer = StringBuffer();
  for (final s in strs) {
    buffer.write(s.replaceAll('/', '//'));
    buffer.write('/:');
  }
  return buffer.toString();
}

List<String> decode(String s) {
  final result = <String>[];
  final current = StringBuffer();
  var i = 0;
  while (i < s.length) {
    if (s[i] == '/') {
      if (s[i + 1] == '/') {
        current.write('/');
      } else {
        result.add(current.toString());
        current.clear();
      }
      i += 2;
    } else {
      current.write(s[i]);
      i++;
    }
  }
  return result;
}
