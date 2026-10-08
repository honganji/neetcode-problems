import 'dart:math';

int trap(List<int> height) {
  final n = height.length;
  if (n == 0) return 0;
  final leftMax = List<int>.filled(n, 0);
  final rightMax = List<int>.filled(n, 0);
  leftMax[0] = height[0];
  for (var i = 1; i < n; i++) {
    leftMax[i] = max(leftMax[i - 1], height[i]);
  }
  rightMax[n - 1] = height[n - 1];
  for (var i = n - 2; i >= 0; i--) {
    rightMax[i] = max(rightMax[i + 1], height[i]);
  }
  var water = 0;
  for (var i = 0; i < n; i++) {
    water += min(leftMax[i], rightMax[i]) - height[i];
  }
  return water;
}
