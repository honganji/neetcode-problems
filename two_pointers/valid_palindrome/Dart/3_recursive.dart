bool isPalindrome(String s) {
  bool isAlnum(int c) =>
      (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122);

  final cleaned = s.toLowerCase().codeUnits.where(isAlnum).toList();

  bool check(int left, int right) {
    if (left >= right) {
      return true;
    }
    if (cleaned[left] != cleaned[right]) {
      return false;
    }
    return check(left + 1, right - 1);
  }

  return check(0, cleaned.length - 1);
}
