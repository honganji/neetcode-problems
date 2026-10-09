import 'dart:collection';
import 'dart:math';

class Solution {
  String alienOrder(List<String> words) {
    // Letters are numbered 0..25 (a..z). adj[u][v] is true when u must come before v.
    final present = List<bool>.filled(26, false);
    final adj = List.generate(26, (_) => List<bool>.filled(26, false));

    for (final word in words) {
      for (final ch in word.codeUnits) {
        present[ch - 97] = true;
      }
    }

    for (var i = 0; i + 1 < words.length; i++) {
      final first = words[i].codeUnits;
      final second = words[i + 1].codeUnits;
      final limit = min(first.length, second.length);
      var j = 0;
      while (j < limit && first[j] == second[j]) {
        j++;
      }
      if (j == limit) {
        // "abc" before "ab" can never be sorted
        if (first.length > second.length) return '';
        continue;
      }
      adj[first[j] - 97][second[j] - 97] = true;
    }

    // Count how many letters must come right before each letter
    final indegree = List<int>.filled(26, 0);
    for (var u = 0; u < 26; u++) {
      for (var v = 0; v < 26; v++) {
        if (adj[u][v]) indegree[v]++;
      }
    }

    // Letters with nothing blocking them can go first
    final queue = Queue<int>();
    var total = 0;
    for (var c = 0; c < 26; c++) {
      if (present[c]) {
        total++;
        if (indegree[c] == 0) queue.add(c);
      }
    }

    final order = StringBuffer();
    while (queue.isNotEmpty) {
      final u = queue.removeFirst();
      order.writeCharCode(u + 97);
      for (var v = 0; v < 26; v++) {
        if (adj[u][v]) {
          indegree[v]--;
          if (indegree[v] == 0) queue.add(v);
        }
      }
    }

    // Letters stuck with blockers form a cycle, so no valid order exists
    return order.length == total ? order.toString() : '';
  }
}
