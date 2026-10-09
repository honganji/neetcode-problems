bool canAttendMeetings(List<List<int>> intervals) {
  // Sort by start time so any overlap must be between neighbors.
  final ordered = [...intervals]..sort((a, b) => a[0].compareTo(b[0]));
  for (var i = 1; i < ordered.length; i++) {
    // The next meeting starts before the previous one ends.
    if (ordered[i][0] < ordered[i - 1][1]) return false;
  }
  return true;
}
