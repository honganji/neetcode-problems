class LRUCache {
  final int _capacity;
  final List<List<int>> _items = [];

  LRUCache(int capacity) : _capacity = capacity;

  int _find(int key) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i][0] == key) return i;
    }
    return -1;
  }

  int get(int key) {
    final i = _find(key);
    if (i == -1) return -1;
    final pair = _items.removeAt(i);
    _items.add(pair);
    return pair[1];
  }

  void put(int key, int value) {
    final i = _find(key);
    if (i != -1) {
      _items.removeAt(i);
    } else if (_items.length == _capacity) {
      _items.removeAt(0);
    }
    _items.add([key, value]);
  }
}
