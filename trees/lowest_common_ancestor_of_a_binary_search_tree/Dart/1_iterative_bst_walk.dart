// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
  if (root == null || p == null || q == null) return null;
  TreeNode? node = root;
  while (node != null) {
    if (p.val < node.val && q.val < node.val) {
      node = node.left;
    } else if (p.val > node.val && q.val > node.val) {
      node = node.right;
    } else {
      return node;
    }
  }
  return null;
}
