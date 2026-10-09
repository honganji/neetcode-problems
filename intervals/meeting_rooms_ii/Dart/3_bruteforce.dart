int minMeetingRooms(List<List<int>> intervals) {
  var best = 0;
  for (final meeting in intervals) {
    final checkTime = meeting[0];
    // Count the meetings that are in progress at this start time.
    final busy = intervals
        .where((other) => other[0] <= checkTime && checkTime < other[1])
        .length;
    if (busy > best) best = busy;
  }
  return best;
}
