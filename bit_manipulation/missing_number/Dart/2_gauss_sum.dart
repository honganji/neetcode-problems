class Solution {
  int missingNumber(List<int> nums) {
    // 0..n should add up to n(n+1)/2; the gap to the actual sum is the missing number.
    final n = nums.length;
    final expected = (n * (n + 1)) ~/ 2;
    return expected - nums.fold(0, (sum, num) => sum + num);
  }
}
