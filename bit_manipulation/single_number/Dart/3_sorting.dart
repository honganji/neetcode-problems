class Solution {
  int singleNumber(List<int> nums) {
    final sorted = [...nums]..sort(); // sorted copy, input is left unchanged
    var i = 0;
    while (i < sorted.length - 1) {
      if (sorted[i] != sorted[i + 1]) return sorted[i];
      i += 2; // skip the matching pair
    }
    return sorted.last; // the single number is at the end
  }
}
