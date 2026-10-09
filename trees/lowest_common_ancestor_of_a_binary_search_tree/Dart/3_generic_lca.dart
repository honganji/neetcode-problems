// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
  if (root == null || identical(root, p) || identical(root, q)) return root;
  final left = lowestCommonAncestor(root.left, p, q);
  final right = lowestCommonAncestor(root.right, p, q);
  if (left != null && right != null) return root;
  return left ?? right;
}
