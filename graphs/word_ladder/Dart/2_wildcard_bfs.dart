class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    // Group words by wildcard patterns: "h*t" holds hit, hot, ...
    final buckets = <String, List<String>>{};
    for (final word in wordList) {
      for (var i = 0; i < word.length; i++) {
        buckets.putIfAbsent(_pattern(word, i), () => []).add(word);
      }
    }

    // Level-by-level BFS.
    final visited = <String>{beginWord};
    var level = <String>[beginWord];
    var count = 1;
    while (level.isNotEmpty) {
      final next = <String>[];
      for (final word in level) {
        if (word == endWord) return count;
        for (var i = 0; i < word.length; i++) {
          // remove so each bucket is expanded only once
          final bucket = buckets.remove(_pattern(word, i));
          if (bucket == null) continue;
          for (final neighbor in bucket) {
            if (visited.add(neighbor)) next.add(neighbor);
          }
        }
      }
      level = next;
      count++;
    }
    return 0;
  }

  String _pattern(String word, int i) =>
      '${word.substring(0, i)}*${word.substring(i + 1)}';
}
