bool isValid(String s) {
  var current = s;
  while (true) {
    final reduced = current
        .replaceAll('()', '')
        .replaceAll('[]', '')
        .replaceAll('{}', '');
    if (reduced == current) {
      return current.isEmpty;
    }
    current = reduced;
  }
}
