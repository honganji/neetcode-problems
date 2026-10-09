class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    final unvisited = wordList.toSet();
    if (!unvisited.contains(endWord)) return 0;

    // Search from both ends and always grow the smaller frontier.
    var front = <String>{beginWord};
    var back = <String>{endWord};
    unvisited.remove(beginWord);
    unvisited.remove(endWord);
    var steps = 1; // words in the path so far, counting beginWord

    while (front.isNotEmpty && back.isNotEmpty) {
      if (front.length > back.length) {
        final tmp = front;
        front = back;
        back = tmp;
      }

      final nextFront = <String>{};
      for (final word in front) {
        final chars = word.split('');
        for (var i = 0; i < chars.length; i++) {
          final original = chars[i];
          for (var code = 0x61; code <= 0x7a; code++) {
            final letter = String.fromCharCode(code);
            if (letter == original) continue;
            chars[i] = letter;
            final candidate = chars.join();
            if (back.contains(candidate)) return steps + 1; // the two searches meet
            if (unvisited.remove(candidate)) nextFront.add(candidate);
          }
          chars[i] = original;
        }
      }

      front = nextFront;
      steps++;
    }
    return 0;
  }
}
