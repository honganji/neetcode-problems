import 'dart:math';

int findKthLargest(List<int> nums, int k) {
  // In sorted order, the kth largest sits at index length - k.
  final target = nums.length - k;
  final rng = Random();
  var lo = 0;
  var hi = nums.length - 1;
  while (true) {
    final pivot = nums[lo + rng.nextInt(hi - lo + 1)];
    // 3-way partition: smaller values left, equal values in the middle, larger right.
    var lt = lo;
    var i = lo;
    var gt = hi;
    while (i <= gt) {
      if (nums[i] < pivot) {
        _swap(nums, lt, i);
        lt++;
        i++;
      } else if (nums[i] > pivot) {
        _swap(nums, i, gt);
        gt--;
      } else {
        i++;
      }
    }
    // Only one side can contain the target, so keep searching just that side.
    if (target < lt) {
      hi = lt - 1;
    } else if (target > gt) {
      lo = gt + 1;
    } else {
      return pivot;
    }
  }
}

void _swap(List<int> a, int i, int j) {
  final t = a[i];
  a[i] = a[j];
  a[j] = t;
}
