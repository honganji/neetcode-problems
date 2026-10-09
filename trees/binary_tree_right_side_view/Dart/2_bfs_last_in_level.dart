import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<int> rightSideView(TreeNode? root) {
  if (root == null) return [];
  final result = <int>[];
  final queue = ListQueue<TreeNode>()..add(root);
  while (queue.isNotEmpty) {
    final levelSize = queue.length;
    for (var i = 0; i < levelSize; i++) {
      final node = queue.removeFirst();
      if (i == levelSize - 1) {
        result.add(node.val);
      }
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
  }
  return result;
}
