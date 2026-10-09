// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  final left = maxDepth(root.left);
  final right = maxDepth(root.right);
  return 1 + (left > right ? left : right);
}
