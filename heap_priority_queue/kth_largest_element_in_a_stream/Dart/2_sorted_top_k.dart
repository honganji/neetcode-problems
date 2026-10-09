class KthLargest {
  final int k;
  // Sorted ascending, holding only the k largest values seen so far.
  final List<int> _top = [];

  KthLargest(this.k, List<int> nums) {
    final sorted = [...nums]..sort();
    _top.addAll(sorted.length > k ? sorted.sublist(sorted.length - k) : sorted);
  }

  int add(int val) {
    if (_top.length < k) {
      _insertSorted(val);
    } else if (val > _top.first) {
      // Drop the smallest of the top k, then slot the new value in order.
      _top.removeAt(0);
      _insertSorted(val);
    }
    return _top.first;
  }

  // Binary search for the first position holding a value >= val, then insert there.
  void _insertSorted(int val) {
    var low = 0;
    var high = _top.length;
    while (low < high) {
      final mid = (low + high) ~/ 2;
      if (_top[mid] < val) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    _top.insert(low, val);
  }
}
