class Solution {
  int lengthOfLIS(List<int> nums) {
    // Compress values to ranks 1..m so they can index the Fenwick tree.
    final uniq = nums.toSet().toList()..sort();
    final rank = <int, int>{
      for (var i = 0; i < uniq.length; i++) uniq[i]: i + 1,
    };
    final m = uniq.length;
    // tree[i] holds the best subsequence length over a range of ranks.
    final tree = List<int>.filled(m + 1, 0);

    var best = 0;
    for (final x in nums) {
      final r = rank[x]!;

      // Best length among smaller values (ranks 1..r-1).
      var cur = 0;
      for (var i = r - 1; i > 0; i -= i & -i) {
        if (tree[i] > cur) cur = tree[i];
      }

      final length = cur + 1;

      // Record this length at rank r.
      for (var i = r; i <= m; i += i & -i) {
        if (tree[i] < length) tree[i] = length;
      }
      if (length > best) best = length;
    }
    return best;
  }
}
