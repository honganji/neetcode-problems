bool isPalindrome(String s) {
  bool isAlnum(int c) =>
      (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122);

  final cleaned = s.toLowerCase().codeUnits.where(isAlnum).toList();
  for (var i = 0; i < cleaned.length ~/ 2; i++) {
    if (cleaned[i] != cleaned[cleaned.length - 1 - i]) {
      return false;
    }
  }
  return true;
}
