// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<int> rightSideView(TreeNode? root) {
  final result = <int>[];

  void dfs(TreeNode? node, int depth) {
    if (node == null) return;
    if (depth == result.length) {
      result.add(node.val);
    }
    dfs(node.right, depth + 1);
    dfs(node.left, depth + 1);
  }

  dfs(root, 0);
  return result;
}
