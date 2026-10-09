import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? invertTree(TreeNode? root) {
  if (root == null) {
    return null;
  }
  final queue = ListQueue<TreeNode>()..add(root);
  while (queue.isNotEmpty) {
    final node = queue.removeFirst();
    final temp = node.left;
    node.left = node.right;
    node.right = temp;
    if (node.left != null) {
      queue.add(node.left!);
    }
    if (node.right != null) {
      queue.add(node.right!);
    }
  }
  return root;
}
