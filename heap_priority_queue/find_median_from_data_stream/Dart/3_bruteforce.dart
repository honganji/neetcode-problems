class MedianFinder {
  final List<int> _nums = [];

  void addNum(int num) => _nums.add(num);

  double findMedian() {
    final sorted = List<int>.of(_nums)..sort();
    final n = sorted.length;
    final mid = n ~/ 2;
    if (n.isOdd) return sorted[mid].toDouble();
    return (sorted[mid - 1] + sorted[mid]) / 2;
  }
}
