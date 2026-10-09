import 'dart:math';

int lastStoneWeight(List<int> stones) {
  final rest = List<int>.of(stones); // copy so the caller's list is untouched

  while (rest.length > 1) {
    final heaviest = rest.reduce(max);
    rest.remove(heaviest);
    final second = rest.reduce(max);
    rest.remove(second);
    if (heaviest != second) {
      rest.add(heaviest - second);
    }
  }

  return rest.isEmpty ? 0 : rest.first;
}
