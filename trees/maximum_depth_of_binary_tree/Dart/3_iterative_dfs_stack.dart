// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  final stack = <(TreeNode, int)>[(root, 1)];
  var best = 0;
  while (stack.isNotEmpty) {
    final (node, depth) = stack.removeLast();
    if (depth > best) best = depth;
    if (node.left != null) stack.add((node.left!, depth + 1));
    if (node.right != null) stack.add((node.right!, depth + 1));
  }
  return best;
}
