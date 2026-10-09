import 'dart:math';

bool mergeTriplets(List<List<int>> triplets, List<int> target) {
  final n = triplets.length;
  // Try every choice of up to three triplets (repeats allowed).
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < n; j++) {
      for (var k = 0; k < n; k++) {
        final a = max(triplets[i][0], max(triplets[j][0], triplets[k][0]));
        final b = max(triplets[i][1], max(triplets[j][1], triplets[k][1]));
        final c = max(triplets[i][2], max(triplets[j][2], triplets[k][2]));
        if (a == target[0] && b == target[1] && c == target[2]) {
          return true;
        }
      }
    }
  }
  return false;
}
