class Solution {
  int singleNumber(List<int> nums) {
    final seen = <int>{};
    for (final n in nums) {
      if (!seen.remove(n)) {
        seen.add(n); // first time we see n: remember it
      }
    }
    return seen.first; // only the unpaired number is left
  }
}
