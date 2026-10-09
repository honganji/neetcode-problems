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
  final stack = <TreeNode>[root];
  while (stack.isNotEmpty) {
    final node = stack.removeLast();
    final temp = node.left;
    node.left = node.right;
    node.right = temp;
    if (node.left != null) {
      stack.add(node.left!);
    }
    if (node.right != null) {
      stack.add(node.right!);
    }
  }
  return root;
}
