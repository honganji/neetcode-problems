int longestConsecutive(List<int> nums) {
  final numSet = nums.toSet();
  var longest = 0;
  for (final num in numSet) {
    if (numSet.contains(num - 1)) continue;
    var length = 1;
    while (numSet.contains(num + length)) {
      length++;
    }
    if (length > longest) longest = length;
  }
  return longest;
}
