// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<List<int>> levelOrder(TreeNode? root) {
  final result = <List<int>>[];

  void dfs(TreeNode? node, int depth) {
    if (node == null) return;
    if (depth == result.length) result.add(<int>[]);
    result[depth].add(node.val);
    dfs(node.left, depth + 1);
    dfs(node.right, depth + 1);
  }

  dfs(root, 0);
  return result;
}
