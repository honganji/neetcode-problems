import 'dart:math';

int trap(List<int> height) {
  final stack = <int>[];
  var water = 0;
  for (var i = 0; i < height.length; i++) {
    while (stack.isNotEmpty && height[stack.last] < height[i]) {
      final bottom = stack.removeLast();
      if (stack.isEmpty) break;
      final left = stack.last;
      final width = i - left - 1;
      final bounded = min(height[left], height[i]) - height[bottom];
      water += width * bounded;
    }
    stack.add(i);
  }
  return water;
}
