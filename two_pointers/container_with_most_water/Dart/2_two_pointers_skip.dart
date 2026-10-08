int maxArea(List<int> height) {
  var left = 0;
  var right = height.length - 1;
  var best = 0;
  while (left < right) {
    final shorter = height[left] < height[right] ? height[left] : height[right];
    final area = shorter * (right - left);
    if (area > best) {
      best = area;
    }
    while (left < right && height[left] <= shorter) {
      left++;
    }
    while (left < right && height[right] <= shorter) {
      right--;
    }
  }
  return best;
}
