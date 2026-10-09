bool canAttendMeetings(List<List<int>> intervals) {
  for (var i = 0; i < intervals.length; i++) {
    for (var j = i + 1; j < intervals.length; j++) {
      final a = intervals[i];
      final b = intervals[j];
      // Two meetings overlap unless one ends before the other starts.
      if (a[0] < b[1] && b[0] < a[1]) return false;
    }
  }
  return true;
}
