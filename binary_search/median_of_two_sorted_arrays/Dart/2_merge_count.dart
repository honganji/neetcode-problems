double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  final total = nums1.length + nums2.length;
  var i = 0;
  var j = 0;
  var prev = 0;
  var curr = 0;
  for (var k = 0; k < total ~/ 2 + 1; k++) {
    prev = curr;
    if (j >= nums2.length || (i < nums1.length && nums1[i] <= nums2[j])) {
      curr = nums1[i];
      i++;
    } else {
      curr = nums2[j];
      j++;
    }
  }
  if (total % 2 == 1) {
    return curr.toDouble();
  }
  return (prev + curr) / 2;
}
