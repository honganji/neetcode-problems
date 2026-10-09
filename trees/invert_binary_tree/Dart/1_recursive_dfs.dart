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
  final left = invertTree(root.left);
  final right = invertTree(root.right);
  root.left = right;
  root.right = left;
  return root;
}
