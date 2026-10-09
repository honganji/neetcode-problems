import 'dart:collection';

int coinChange(List<int> coins, int amount) {
  if (amount == 0) return 0;
  // Each queue level is "one more coin used"; the first time we reach amount, it's the fewest
  final seen = List<bool>.filled(amount + 1, false);
  seen[0] = true;
  final queue = Queue<int>()..add(0);
  var coinsUsed = 0;
  while (queue.isNotEmpty) {
    coinsUsed++;
    final levelSize = queue.length;
    for (var i = 0; i < levelSize; i++) {
      final total = queue.removeFirst();
      for (final c in coins) {
        if (c > amount - total) continue; // would overshoot
        final next = total + c;
        if (next == amount) return coinsUsed;
        if (!seen[next]) {
          seen[next] = true;
          queue.add(next);
        }
      }
    }
  }
  return -1;
}
