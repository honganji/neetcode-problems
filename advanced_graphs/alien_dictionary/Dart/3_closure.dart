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

    // Floyd-Warshall: afterwards adj[u][v] is true if u must come before v, even indirectly
    for (var k = 0; k < 26; k++) {
      for (var i = 0; i < 26; i++) {
        if (!adj[i][k]) continue;
        for (var j = 0; j < 26; j++) {
          if (adj[k][j]) adj[i][j] = true;
        }
      }
    }

    // A letter that must come before itself means a cycle
    for (var c = 0; c < 26; c++) {
      if (adj[c][c]) return '';
    }

    // A letter that must come later has strictly more letters forced before it,
    // so sorting by that count gives a valid order
    final ancestorCount = List<int>.filled(26, 0);
    for (var u = 0; u < 26; u++) {
      for (var v = 0; v < 26; v++) {
        if (adj[u][v]) ancestorCount[v]++;
      }
    }

    final letters = [
      for (var c = 0; c < 26; c++)
        if (present[c]) c,
    ]..sort((a, b) => ancestorCount[a].compareTo(ancestorCount[b]));
    return String.fromCharCodes(letters.map((c) => c + 97));
  }
}
