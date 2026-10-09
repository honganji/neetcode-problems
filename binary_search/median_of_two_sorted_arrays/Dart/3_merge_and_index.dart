double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  final merged = <int>[];
  var i = 0;
  var j = 0;
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] <= nums2[j]) {
      merged.add(nums1[i]);
      i++;
    } else {
      merged.add(nums2[j]);
      j++;
    }
  }
  merged.addAll(nums1.sublist(i));
  merged.addAll(nums2.sublist(j));
  final total = merged.length;
  final mid = total ~/ 2;
  if (total % 2 == 1) {
    return merged[mid].toDouble();
  }
  return (merged[mid - 1] + merged[mid]) / 2;
}
