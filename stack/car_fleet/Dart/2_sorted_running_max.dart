int carFleet(int target, List<int> position, List<int> speed) {
  final order = List<int>.generate(position.length, (i) => i)
    ..sort((a, b) => position[b].compareTo(position[a]));
  var fleets = 0;
  var slowest = 0.0;
  for (final i in order) {
    final time = (target - position[i]) / speed[i];
    if (time > slowest) {
      fleets++;
      slowest = time;
    }
  }
  return fleets;
}
