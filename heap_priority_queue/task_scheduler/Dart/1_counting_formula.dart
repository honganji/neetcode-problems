import 'dart:math';

class Solution {
  int leastInterval(List<String> tasks, int n) {
    final counts = <String, int>{};
    for (final task in tasks) {
      counts[task] = (counts[task] ?? 0) + 1;
    }
    final maxFreq = counts.values.reduce(max);
    // How many letters tie for the highest count
    final maxCount = counts.values.where((c) => c == maxFreq).length;

    // (maxFreq - 1) gaps of size n + 1, plus one final slot per tied letter
    final formula = (maxFreq - 1) * (n + 1) + maxCount;
    // If there are more tasks than the layout holds, no idle time is needed
    return max(tasks.length, formula);
  }
}
