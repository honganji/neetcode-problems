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
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return best;
}
