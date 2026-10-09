double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  var a = nums1;
  var b = nums2;
  if (a.length > b.length) {
    a = nums2;
    b = nums1;
  }
  final m = a.length;
  final n = b.length;
  final half = (m + n + 1) ~/ 2;
  var low = 0;
  var high = m;
  while (low <= high) {
    final i = (low + high) ~/ 2;
    final j = half - i;
    final maxLeftA = i > 0 ? a[i - 1].toDouble() : double.negativeInfinity;
    final minRightA = i < m ? a[i].toDouble() : double.infinity;
    final maxLeftB = j > 0 ? b[j - 1].toDouble() : double.negativeInfinity;
    final minRightB = j < n ? b[j].toDouble() : double.infinity;
    if (maxLeftA <= minRightB && maxLeftB <= minRightA) {
      final maxLeft = maxLeftA > maxLeftB ? maxLeftA : maxLeftB;
      if ((m + n) % 2 == 1) {
        return maxLeft;
      }
      final minRight = minRightA < minRightB ? minRightA : minRightB;
      return (maxLeft + minRight) / 2;
    }
    if (maxLeftA > minRightB) {
      high = i - 1;
    } else {
      low = i + 1;
    }
  }
  return 0.0;
}
