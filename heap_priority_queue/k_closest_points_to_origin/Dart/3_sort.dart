List<List<int>> kClosest(List<List<int>> points, int k) {
  int dist(List<int> p) => p[0] * p[0] + p[1] * p[1];

  // Sort by squared distance, then keep the first k.
  points.sort((a, b) => dist(a).compareTo(dist(b)));
  return points.sublist(0, k);
}
