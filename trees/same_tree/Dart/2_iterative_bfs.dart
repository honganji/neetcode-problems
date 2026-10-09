import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isSameTree(TreeNode? p, TreeNode? q) {
  final queue = ListQueue<List<TreeNode?>>();
  queue.add([p, q]);
  while (queue.isNotEmpty) {
    final pair = queue.removeFirst();
    final a = pair[0];
    final b = pair[1];
    if (a == null && b == null) continue;
    if (a == null || b == null || a.val != b.val) return false;
    queue.add([a.left, b.left]);
    queue.add([a.right, b.right]);
  }
  return true;
}
