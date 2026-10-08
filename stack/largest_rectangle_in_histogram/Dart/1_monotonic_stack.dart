int largestRectangleArea(List<int> heights) {
  var best = 0;
  final stackIndex = <int>[];
  final stackHeight = <int>[];
  for (var i = 0; i < heights.length; i++) {
    var start = i;
    while (stackHeight.isNotEmpty && stackHeight.last > heights[i]) {
      final index = stackIndex.removeLast();
      final h = stackHeight.removeLast();
      if (h * (i - index) > best) {
        best = h * (i - index);
      }
      start = index;
    }
    stackIndex.add(start);
    stackHeight.add(heights[i]);
  }
  for (var k = 0; k < stackIndex.length; k++) {
    final area = stackHeight[k] * (heights.length - stackIndex[k]);
    if (area > best) {
      best = area;
    }
  }
  return best;
}
