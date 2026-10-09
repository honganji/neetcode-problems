// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isSubtree(TreeNode? root, TreeNode? subRoot) {
  bool isSameTree(TreeNode? a, TreeNode? b) {
    if (a == null || b == null) {
      return a == b;
    }
    return a.val == b.val &&
        isSameTree(a.left, b.left) &&
        isSameTree(a.right, b.right);
  }

  if (subRoot == null) {
    return true;
  }
  if (root == null) {
    return false;
  }
  if (isSameTree(root, subRoot)) {
    return true;
  }
  return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
}
