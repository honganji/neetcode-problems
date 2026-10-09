// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int bestDownward(TreeNode? node) {
  if (node == null) return 0;
  final left = bestDownward(node.left);
  final right = bestDownward(node.right);
  var child = left > right ? left : right;
  if (child < 0) child = 0;
  return node.val + child;
}

int maxPathSum(TreeNode? root) {
  if (root == null) return -1 << 62;
  var left = bestDownward(root.left);
  var right = bestDownward(root.right);
  if (left < 0) left = 0;
  if (right < 0) right = 0;
  var best = root.val + left + right;
  final leftBest = maxPathSum(root.left);
  final rightBest = maxPathSum(root.right);
  if (leftBest > best) best = leftBest;
  if (rightBest > best) best = rightBest;
  return best;
}
