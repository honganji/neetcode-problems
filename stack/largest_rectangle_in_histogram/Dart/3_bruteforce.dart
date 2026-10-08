int largestRectangleArea(List<int> heights) {
  var best = 0;
  for (var i = 0; i < heights.length; i++) {
    var left = i;
    while (left > 0 && heights[left - 1] >= heights[i]) {
      left--;
    }
    var right = i;
    while (right < heights.length - 1 && heights[right + 1] >= heights[i]) {
      right++;
    }
    final area = heights[i] * (right - left + 1);
    if (area > best) {
      best = area;
    }
  }
  return best;
}
