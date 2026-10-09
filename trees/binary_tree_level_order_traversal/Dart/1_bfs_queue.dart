import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<List<int>> levelOrder(TreeNode? root) {
  final result = <List<int>>[];
  if (root == null) return result;
  final queue = ListQueue<TreeNode>()..add(root);
  while (queue.isNotEmpty) {
    final level = <int>[];
    final size = queue.length;
    for (var i = 0; i < size; i++) {
      final node = queue.removeFirst();
      level.add(node.val);
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    result.add(level);
  }
  return result;
}
