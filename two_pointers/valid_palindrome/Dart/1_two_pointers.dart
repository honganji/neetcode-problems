bool isPalindrome(String s) {
  bool isAlnum(int c) =>
      (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122);
  int lower(int c) => (c >= 65 && c <= 90) ? c + 32 : c;

  final units = s.codeUnits;
  var left = 0;
  var right = units.length - 1;
  while (left < right) {
    while (left < right && !isAlnum(units[left])) {
      left++;
    }
    while (left < right && !isAlnum(units[right])) {
      right--;
    }
    if (lower(units[left]) != lower(units[right])) {
      return false;
    }
    left++;
    right--;
  }
  return true;
}
