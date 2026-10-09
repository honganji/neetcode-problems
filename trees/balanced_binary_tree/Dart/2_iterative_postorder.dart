// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isBalanced(TreeNode? root) {
  if (root == null) return true;
  final heights = <TreeNode, int>{};
  final nodes = <TreeNode>[root];
  final visited = <bool>[false];
  while (nodes.isNotEmpty) {
    final node = nodes.removeLast();
    final seen = visited.removeLast();
    if (seen) {
      final left = heights[node.left] ?? 0;
      final right = heights[node.right] ?? 0;
      if ((left - right).abs() > 1) return false;
      heights[node] = 1 + (left > right ? left : right);
    } else {
      nodes.add(node);
      visited.add(true);
      if (node.right != null) {
        nodes.add(node.right!);
        visited.add(false);
      }
      if (node.left != null) {
        nodes.add(node.left!);
        visited.add(false);
      }
    }
  }
  return true;
}
