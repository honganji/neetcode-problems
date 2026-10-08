int longestConsecutive(List<int> nums) {
  if (nums.isEmpty) return 0;
  final sorted = List<int>.from(nums)..sort();
  var longest = 1;
  var length = 1;
  for (var i = 1; i < sorted.length; i++) {
    if (sorted[i] == sorted[i - 1]) continue;
    if (sorted[i] == sorted[i - 1] + 1) {
      length++;
    } else {
      length = 1;
    }
    if (length > longest) longest = length;
  }
  return longest;
}
