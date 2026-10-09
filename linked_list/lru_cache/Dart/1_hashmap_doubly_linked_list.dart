class _Node {
  int key;
  int val;
  _Node? prev;
  _Node? next;
  _Node(this.key, this.val);
}

class LRUCache {
  final int _capacity;
  final Map<int, _Node> _nodes = {};
  final _Node _head = _Node(0, 0);
  final _Node _tail = _Node(0, 0);

  LRUCache(int capacity) : _capacity = capacity {
    _head.next = _tail;
    _tail.prev = _head;
  }

  void _remove(_Node node) {
    final prev = node.prev!;
    final next = node.next!;
    prev.next = next;
    next.prev = prev;
  }

  void _addToFront(_Node node) {
    node.prev = _head;
    node.next = _head.next;
    _head.next!.prev = node;
    _head.next = node;
  }

  int get(int key) {
    final node = _nodes[key];
    if (node == null) return -1;
    _remove(node);
    _addToFront(node);
    return node.val;
  }

  void put(int key, int value) {
    final existing = _nodes[key];
    if (existing != null) {
      existing.val = value;
      _remove(existing);
      _addToFront(existing);
      return;
    }
    if (_nodes.length == _capacity) {
      final lru = _tail.prev!;
      _remove(lru);
      _nodes.remove(lru.key);
    }
    final node = _Node(key, value);
    _nodes[key] = node;
    _addToFront(node);
  }
}
