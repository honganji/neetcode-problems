import 'dart:collection';

class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    final words = {...wordList, beginWord}.toList();
    final index = <String, int>{
      for (var i = 0; i < words.length; i++) words[i]: i,
    };
    if (!index.containsKey(endWord)) return 0;

    // Build the full graph: connect every pair of words that differ by one letter.
    final graph = List.generate(words.length, (_) => <int>[]);
    for (var i = 0; i < words.length; i++) {
      for (var j = i + 1; j < words.length; j++) {
        if (_oneLetterApart(words[i], words[j])) {
          graph[i].add(j);
          graph[j].add(i);
        }
      }
    }

    // Plain BFS on the explicit graph.
    final start = index[beginWord]!;
    final end = index[endWord]!;
    final dist = List<int>.filled(words.length, 0); // 0 = unvisited
    dist[start] = 1;
    final queue = Queue<int>()..add(start);
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      if (node == end) return dist[node];
      for (final next in graph[node]) {
        if (dist[next] == 0) {
          dist[next] = dist[node] + 1;
          queue.add(next);
        }
      }
    }
    return 0;
  }

  bool _oneLetterApart(String a, String b) {
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) diff++;
    }
    return diff == 1;
  }
}
