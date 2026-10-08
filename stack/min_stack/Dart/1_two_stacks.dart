class MinStack {
  final List<int> _stack = [];
  final List<int> _minStack = [];

  MinStack();

  void push(int val) {
    _stack.add(val);
    if (_minStack.isNotEmpty && _minStack.last < val) {
      _minStack.add(_minStack.last);
    } else {
      _minStack.add(val);
    }
  }

  void pop() {
    _stack.removeLast();
    _minStack.removeLast();
  }

  int top() {
    return _stack.last;
  }

  int getMin() {
    return _minStack.last;
  }
}
