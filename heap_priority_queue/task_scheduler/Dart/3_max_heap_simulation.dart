import 'dart:collection';

class Solution {
  int leastInterval(List<String> tasks, int n) {
    final counts = <String, int>{};
    for (final task in tasks) {
      counts[task] = (counts[task] ?? 0) + 1;
    }

    // Dart's PriorityQueue is in package:collection, so keep the ready counts
    // in a sorted list instead. There are at most 26 values, and the largest
    // remaining count is always the last one.
    final available = counts.values.toList()..sort();

    // (remaining count, time it becomes ready again)
    final cooldown = Queue<(int, int)>();

    var time = 0;
    while (available.isNotEmpty || cooldown.isNotEmpty) {
      time++;
      // A task that finished its cooldown goes back into the list
      if (cooldown.isNotEmpty && cooldown.first.$2 == time) {
        available
          ..add(cooldown.removeFirst().$1)
          ..sort();
      }
      if (available.isNotEmpty) {
        final remaining = available.removeLast() - 1; // run one copy
        if (remaining > 0) {
          cooldown.add((remaining, time + n + 1));
        }
      }
      // If nothing is available, this slot is idle
    }
    return time;
  }
}
