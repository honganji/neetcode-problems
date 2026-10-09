int findKthLargest(List<int> nums, int k) {
  // Sort a copy ascending; the kth largest is k positions from the end.
  final sorted = [...nums]..sort();
  return sorted[sorted.length - k];
}
