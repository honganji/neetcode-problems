int carFleet(int target, List<int> position, List<int> speed) {
  final order = List<int>.generate(position.length, (i) => i)
    ..sort((a, b) => position[b].compareTo(position[a]));
  final stack = <double>[];
  for (final i in order) {
    final time = (target - position[i]) / speed[i];
    if (stack.isEmpty || time > stack.last) {
      stack.add(time);
    }
  }
  return stack.length;
}
