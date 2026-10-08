class MinStack {
  final List<int> _stack = [];

  MinStack();

  void push(int val) {
    _stack.add(val);
  }

  void pop() {
    _stack.removeLast();
  }

  int top() {
    return _stack.last;
  }

  int getMin() {
    var best = _stack.last;
    for (final val in _stack) {
      if (val < best) {
        best = val;
      }
    }
    return best;
  }
}
