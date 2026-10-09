import 'dart:math';

bool mergeTriplets(List<List<int>> triplets, List<int> target) {
  var bestA = 0;
  var bestB = 0;
  var bestC = 0;
  for (final t in triplets) {
    // A triplet larger than the target in any position can never be used.
    if (t[0] <= target[0] && t[1] <= target[1] && t[2] <= target[2]) {
      bestA = max(bestA, t[0]);
      bestB = max(bestB, t[1]);
      bestC = max(bestC, t[2]);
    }
  }
  return bestA == target[0] && bestB == target[1] && bestC == target[2];
}
