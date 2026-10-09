// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isValidBST(TreeNode? root) {
  bool valid(TreeNode? node, int? low, int? high) {
    if (node == null) return true;
    if (low != null && node.val <= low) return false;
    if (high != null && node.val >= high) return false;
    return valid(node.left, low, node.val) && valid(node.right, node.val, high);
  }

  return valid(root, null, null);
}
