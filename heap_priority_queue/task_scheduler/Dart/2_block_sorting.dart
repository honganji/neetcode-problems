class Solution {
  int leastInterval(List<String> tasks, int n) {
    final counts = List<int>.filled(26, 0);
    for (final task in tasks) {
      counts[task.codeUnitAt(0) - 'A'.codeUnitAt(0)]++;
    }

    var time = 0;
    var left = tasks.length;
    while (left > 0) {
      // Most frequent letters first, so each block takes the busiest tasks
      counts.sort((a, b) => b.compareTo(a));
      var slots = n + 1; // one block = n + 1 slots
      for (var i = 0; i < 26; i++) {
        if (slots == 0 || counts[i] == 0) break;
        counts[i]--;
        slots--;
        left--;
        time++;
      }
      if (left > 0) time += slots; // idle for the rest of the block
    }
    return time;
  }
}
