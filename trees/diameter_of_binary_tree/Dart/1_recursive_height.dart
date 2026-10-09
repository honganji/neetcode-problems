// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int diameterOfBinaryTree(TreeNode? root) {
  var best = 0;

  int height(TreeNode? node) {
    if (node == null) return 0;
    final left = height(node.left);
    final right = height(node.right);
    if (left + right > best) best = left + right;
    return 1 + (left > right ? left : right);
  }

  height(root);
  return best;
}
