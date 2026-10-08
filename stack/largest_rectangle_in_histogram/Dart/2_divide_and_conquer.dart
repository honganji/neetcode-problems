int largestRectangleArea(List<int> heights) {
  int solve(int left, int right) {
    if (left > right) {
      return 0;
    }
    var minIndex = left;
    for (var i = left + 1; i <= right; i++) {
      if (heights[i] < heights[minIndex]) {
        minIndex = i;
      }
    }
    var best = heights[minIndex] * (right - left + 1);
    final leftArea = solve(left, minIndex - 1);
    if (leftArea > best) {
      best = leftArea;
    }
    final rightArea = solve(minIndex + 1, right);
    if (rightArea > best) {
      best = rightArea;
    }
    return best;
  }

  return solve(0, heights.length - 1);
}
