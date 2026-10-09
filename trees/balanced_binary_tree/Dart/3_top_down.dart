// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int _height(TreeNode? node) {
  if (node == null) return 0;
  final left = _height(node.left);
  final right = _height(node.right);
  return 1 + (left > right ? left : right);
}

bool isBalanced(TreeNode? root) {
  if (root == null) return true;
  if ((_height(root.left) - _height(root.right)).abs() > 1) return false;
  return isBalanced(root.left) && isBalanced(root.right);
}
