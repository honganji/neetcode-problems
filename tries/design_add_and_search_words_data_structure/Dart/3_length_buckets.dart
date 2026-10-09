class WordDictionary {
  final Map<int, List<String>> _buckets = {};

  WordDictionary();

  void addWord(String word) {
    _buckets.putIfAbsent(word.length, () => []).add(word);
  }

  bool search(String word) {
    final candidates = _buckets[word.length];
    if (candidates == null) return false;
    for (final candidate in candidates) {
      if (_matches(word, candidate)) return true;
    }
    return false;
  }

  bool _matches(String pattern, String candidate) {
    for (var i = 0; i < pattern.length; i++) {
      final p = pattern.codeUnitAt(i);
      if (p != 46 && p != candidate.codeUnitAt(i)) return false;
    }
    return true;
  }
}
