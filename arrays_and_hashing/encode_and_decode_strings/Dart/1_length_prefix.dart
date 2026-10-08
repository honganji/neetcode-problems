String encode(List<String> strs) {
  final buffer = StringBuffer();
  for (final s in strs) {
    buffer.write(s.length);
    buffer.write('#');
    buffer.write(s);
  }
  return buffer.toString();
}

List<String> decode(String s) {
  final result = <String>[];
  var i = 0;
  while (i < s.length) {
    final j = s.indexOf('#', i);
    final length = int.parse(s.substring(i, j));
    final start = j + 1;
    result.add(s.substring(start, start + length));
    i = start + length;
  }
  return result;
}
