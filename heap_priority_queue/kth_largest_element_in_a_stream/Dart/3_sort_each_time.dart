class KthLargest {
  final int k;
  final List<int> _nums;

  KthLargest(this.k, List<int> nums) : _nums = [...nums];

  int add(int val) {
    _nums.add(val);
    // Re-sort everything on every query and read off the kth largest.
    final descending = [..._nums]..sort((a, b) => b.compareTo(a));
    return descending[k - 1];
  }
}
