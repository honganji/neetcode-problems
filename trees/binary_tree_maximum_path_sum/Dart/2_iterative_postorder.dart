// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int maxPathSum(TreeNode? root) {
  if (root == null) return 0;
  var best = -1 << 62;
  final gains = <TreeNode, int>{};
  final stack = <TreeNode>[root];
  final visited = <bool>[false];
  while (stack.isNotEmpty) {
    final node = stack.removeLast();
    final done = visited.removeLast();
    if (!done) {
      stack.add(node);
      visited.add(true);
      if (node.right != null) {
        stack.add(node.right!);
        visited.add(false);
      }
      if (node.left != null) {
        stack.add(node.left!);
        visited.add(false);
      }
      continue;
    }
    final leftGain = node.left == null ? 0 : gains[node.left!]!;
    final rightGain = node.right == null ? 0 : gains[node.right!]!;
    final left = leftGain > 0 ? leftGain : 0;
    final right = rightGain > 0 ? rightGain : 0;
    final through = node.val + left + right;
    if (through > best) best = through;
    gains[node] = node.val + (left > right ? left : right);
  }
  return best;
}
