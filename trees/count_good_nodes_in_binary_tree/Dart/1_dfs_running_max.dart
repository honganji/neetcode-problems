// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int goodNodes(TreeNode? root) {
  int dfs(TreeNode? node, int maxSoFar) {
    if (node == null) return 0;
    final count = node.val >= maxSoFar ? 1 : 0;
    final newMax = node.val > maxSoFar ? node.val : maxSoFar;
    return count + dfs(node.left, newMax) + dfs(node.right, newMax);
  }

  if (root == null) return 0;
  return dfs(root, root.val);
}
