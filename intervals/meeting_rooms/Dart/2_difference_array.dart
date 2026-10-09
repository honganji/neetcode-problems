bool canAttendMeetings(List<List<int>> intervals) {
  // Mark +1 where each meeting starts and -1 where it ends.
  var latest = 0;
  for (final meeting in intervals) {
    if (meeting[1] > latest) latest = meeting[1];
  }
  final changes = List<int>.filled(latest + 1, 0);
  for (final meeting in intervals) {
    changes[meeting[0]]++;
    changes[meeting[1]]--;
  }

  // Walk the timeline; more than one meeting in progress means a clash.
  var inProgress = 0;
  for (final change in changes) {
    inProgress += change;
    if (inProgress > 1) return false;
  }
  return true;
}
