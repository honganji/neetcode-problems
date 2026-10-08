String encode(List<String> strs) {
  final buffer = StringBuffer();
  for (final s in strs) {
    buffer.write(s.codeUnits.join(','));
    buffer.write(';');
  }
  return buffer.toString();
}

List<String> decode(String s) {
  final result = <String>[];
  final chunks = s.split(';');
  for (var k = 0; k < chunks.length - 1; k++) {
    final chunk = chunks[k];
    if (chunk.isEmpty) {
      result.add('');
    } else {
      final codes = chunk.split(',').map(int.parse).toList();
      result.add(String.fromCharCodes(codes));
    }
  }
  return result;
}
