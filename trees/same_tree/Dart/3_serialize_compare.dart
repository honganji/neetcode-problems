// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

String _serialize(TreeNode? node) {
  final parts = <String>[];
  final stack = <TreeNode?>[node];
  while (stack.isNotEmpty) {
    final current = stack.removeLast();
    if (current == null) {
      parts.add('#');
      continue;
    }
    parts.add(current.val.toString());
    stack.add(current.right);
    stack.add(current.left);
  }
  return parts.join(',');
}

bool isSameTree(TreeNode? p, TreeNode? q) {
  return _serialize(p) == _serialize(q);
}
