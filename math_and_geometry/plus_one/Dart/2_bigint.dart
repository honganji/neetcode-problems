List<int> plusOne(List<int> digits) {
  // BigInt has no size limit, so join the digits into one number and add 1.
  final number = BigInt.parse(digits.join()) + BigInt.one;
  return [for (final ch in number.toString().split('')) int.parse(ch)];
}
