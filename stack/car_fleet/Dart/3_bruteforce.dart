int carFleet(int target, List<int> position, List<int> speed) {
  final order = List<int>.generate(position.length, (i) => i)
    ..sort((a, b) => position[b].compareTo(position[a]));
  final times = [for (final i in order) (target - position[i]) / speed[i]];
  var fleets = 0;
  for (var i = 0; i < times.length; i++) {
    var ahead = 0.0;
    for (var j = 0; j < i; j++) {
      if (times[j] > ahead) {
        ahead = times[j];
      }
    }
    if (times[i] > ahead) {
      fleets++;
    }
  }
  return fleets;
}
