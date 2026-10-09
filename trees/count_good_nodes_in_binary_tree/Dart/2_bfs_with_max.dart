import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int goodNodes(TreeNode? root) {
  if (root == null) return 0;
  var count = 0;
  final queue = ListQueue<(TreeNode, int)>()..add((root, root.val));
  while (queue.isNotEmpty) {
    final (node, maxSoFar) = queue.removeFirst();
    if (node.val >= maxSoFar) count++;
    final newMax = node.val > maxSoFar ? node.val : maxSoFar;
    final left = node.left;
    final right = node.right;
    if (left != null) queue.add((left, newMax));
    if (right != null) queue.add((right, newMax));
  }
  return count;
}
