// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int maxPathSum(TreeNode? root) {
  var best = -1 << 62;

  int gain(TreeNode? node) {
    if (node == null) return 0;
    final leftGain = gain(node.left);
    final rightGain = gain(node.right);
    final left = leftGain > 0 ? leftGain : 0;
    final right = rightGain > 0 ? rightGain : 0;
    final through = node.val + left + right;
    if (through > best) best = through;
    return node.val + (left > right ? left : right);
  }

  gain(root);
  return best;
}
