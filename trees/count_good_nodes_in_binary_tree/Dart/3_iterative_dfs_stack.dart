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
  final stack = <(TreeNode, int)>[(root, root.val)];
  while (stack.isNotEmpty) {
    final (node, maxSoFar) = stack.removeLast();
    if (node.val >= maxSoFar) count++;
    final newMax = node.val > maxSoFar ? node.val : maxSoFar;
    final left = node.left;
    final right = node.right;
    if (right != null) stack.add((right, newMax));
    if (left != null) stack.add((left, newMax));
  }
  return count;
}
