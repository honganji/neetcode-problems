int minMeetingRooms(List<List<int>> intervals) {
  // Sort the start times and the end times separately, then walk through the starts in order.
  final starts = [for (final meeting in intervals) meeting[0]]..sort();
  final ends = [for (final meeting in intervals) meeting[1]]..sort();

  var rooms = 0;
  var endPtr = 0;
  for (final start in starts) {
    if (start < ends[endPtr]) {
      // Every room is still busy at this start, so we need a new one.
      rooms++;
    } else {
      // The earliest-ending meeting is over, so its room is free for reuse.
      endPtr++;
    }
  }
  return rooms;
}
