class Trie {
  final Set<String> _words = {};
  final Set<String> _prefixes = {''};

  Trie();

  void insert(String word) {
    _words.add(word);
    for (var end = 1; end <= word.length; end++) {
      _prefixes.add(word.substring(0, end));
    }
  }

  bool search(String word) {
    return _words.contains(word);
  }

  bool startsWith(String prefix) {
    return _prefixes.contains(prefix);
  }
}
