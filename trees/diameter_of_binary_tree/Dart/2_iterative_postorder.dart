// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int diameterOfBinaryTree(TreeNode? root) {
  if (root == null) return 0;
  final heights = <TreeNode, int>{};
  var best = 0;
  final stack = <TreeNode>[root];
  while (stack.isNotEmpty) {
    final node = stack.last;
    final l = node.left;
    final r = node.right;
    if (l != null && !heights.containsKey(l)) {
      stack.add(l);
    } else if (r != null && !heights.containsKey(r)) {
      stack.add(r);
    } else {
      stack.removeLast();
      final left = l == null ? 0 : heights[l]!;
      final right = r == null ? 0 : heights[r]!;
      if (left + right > best) best = left + right;
      heights[node] = 1 + (left > right ? left : right);
    }
  }
  return best;
}
