import 'dart:collection';

class LRUCache {
  final int _capacity;
  final LinkedHashMap<int, int> _cache = LinkedHashMap<int, int>();

  LRUCache(int capacity) : _capacity = capacity;

  int get(int key) {
    final value = _cache.remove(key);
    if (value == null) return -1;
    _cache[key] = value;
    return value;
  }

  void put(int key, int value) {
    _cache.remove(key);
    if (_cache.length == _capacity) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = value;
  }
}
