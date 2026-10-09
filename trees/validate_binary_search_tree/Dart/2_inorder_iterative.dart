// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isValidBST(TreeNode? root) {
  final stack = <TreeNode>[];
  int? prev;
  var node = root;
  while (stack.isNotEmpty || node != null) {
    while (node != null) {
      stack.add(node);
      node = node.left;
    }
    final current = stack.removeLast();
    if (prev != null && current.val <= prev) return false;
    prev = current.val;
    node = current.right;
  }
  return true;
}
