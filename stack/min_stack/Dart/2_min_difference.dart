class MinStack {
  final List<int> _stack = [];
  int _min = 0;

  MinStack();

  void push(int val) {
    if (_stack.isEmpty) {
      _stack.add(0);
      _min = val;
      return;
    }
    _stack.add(val - _min);
    if (val < _min) {
      _min = val;
    }
  }

  void pop() {
    final diff = _stack.removeLast();
    if (diff < 0) {
      _min -= diff;
    }
  }

  int top() {
    final diff = _stack.last;
    if (diff < 0) {
      return _min;
    }
    return _min + diff;
  }

  int getMin() {
    return _min;
  }
}
