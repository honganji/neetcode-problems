class MedianFinder {
  final List<int> _nums = []; // kept sorted at all times

  void addNum(int num) {
    // binary search for the spot, then insert (later items shift over)
    _nums.insert(_insertionIndex(num), num);
  }

  double findMedian() {
    final n = _nums.length;
    final mid = n ~/ 2;
    if (n.isOdd) return _nums[mid].toDouble();
    return (_nums[mid - 1] + _nums[mid]) / 2;
  }

  int _insertionIndex(int num) {
    var lo = 0;
    var hi = _nums.length;
    while (lo < hi) {
      final mid = (lo + hi) ~/ 2;
      if (_nums[mid] < num) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}
