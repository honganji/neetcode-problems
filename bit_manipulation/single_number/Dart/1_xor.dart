class Solution {
  int singleNumber(List<int> nums) {
    var result = 0;
    for (final n in nums) {
      result ^= n; // pairs cancel out: a ^ a == 0
    }
    return result;
  }
}
