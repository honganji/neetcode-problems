import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  final queue = ListQueue<TreeNode>()..add(root);
  var depth = 0;
  while (queue.isNotEmpty) {
    final levelSize = queue.length;
    for (var i = 0; i < levelSize; i++) {
      final node = queue.removeFirst();
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    depth++;
  }
  return depth;
}
