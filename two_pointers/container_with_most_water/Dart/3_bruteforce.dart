int maxArea(List<int> height) {
  var best = 0;
  for (var i = 0; i < height.length; i++) {
    for (var j = i + 1; j < height.length; j++) {
      final shorter = height[i] < height[j] ? height[i] : height[j];
      final area = shorter * (j - i);
      if (area > best) {
        best = area;
      }
    }
  }
  return best;
}
