int longestConsecutive(List<int> nums) {
  var longest = 0;
  for (final num in nums) {
    var length = 1;
    while (nums.contains(num + length)) {
      length++;
    }
    if (length > longest) longest = length;
  }
  return longest;
}
