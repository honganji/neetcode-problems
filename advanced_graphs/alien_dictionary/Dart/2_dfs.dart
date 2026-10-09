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

    // 0 = not visited, 1 = on the current DFS path, 2 = finished
    final state = List<int>.filled(26, 0);
    final postorder = <int>[];

    bool dfs(int u) {
      state[u] = 1;
      for (var v = 0; v < 26; v++) {
        if (!adj[u][v]) continue;
        // Reaching a letter that is still on the path means a cycle
        if (state[v] == 1) return false;
        if (state[v] == 0 && !dfs(v)) return false;
      }
      state[u] = 2;
      postorder.add(u);
      return true;
    }

    for (var c = 0; c < 26; c++) {
      if (present[c] && state[c] == 0 && !dfs(c)) return '';
    }

    // A letter finishes only after every letter it points to, so reversing finish order works
    final order = StringBuffer();
    for (final c in postorder.reversed) {
      order.writeCharCode(c + 97);
    }
    return order.toString();
  }
}
