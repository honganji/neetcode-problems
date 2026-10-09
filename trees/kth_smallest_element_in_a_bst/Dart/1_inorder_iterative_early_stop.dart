// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int kthSmallest(TreeNode? root, int k) {
  final stack = <TreeNode>[];
  var node = root;
  while (stack.isNotEmpty || node != null) {
    while (node != null) {
      stack.add(node);
      node = node.left;
    }
    final current = stack.removeLast();
    k--;
    if (k == 0) {
      return current.val;
    }
    node = current.right;
  }
  return -1;
}
