// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int height(TreeNode? node) {
  if (node == null) return 0;
  final left = height(node.left);
  final right = height(node.right);
  return 1 + (left > right ? left : right);
}

int diameterOfBinaryTree(TreeNode? root) {
  if (root == null) return 0;
  final throughRoot = height(root.left) + height(root.right);
  final leftBest = diameterOfBinaryTree(root.left);
  final rightBest = diameterOfBinaryTree(root.right);
  var best = throughRoot;
  if (leftBest > best) best = leftBest;
  if (rightBest > best) best = rightBest;
  return best;
}
