int trap(List<int> height) {
  var left = 0;
  var right = height.length - 1;
  var leftMax = 0;
  var rightMax = 0;
  var water = 0;
  while (left < right) {
    if (height[left] < height[right]) {
      if (height[left] > leftMax) leftMax = height[left];
      water += leftMax - height[left];
      left++;
    } else {
      if (height[right] > rightMax) rightMax = height[right];
      water += rightMax - height[right];
      right--;
    }
  }
  return water;
}
