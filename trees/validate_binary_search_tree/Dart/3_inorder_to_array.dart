// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isValidBST(TreeNode? root) {
  final values = <int>[];

  void inorder(TreeNode? node) {
    if (node == null) return;
    inorder(node.left);
    values.add(node.val);
    inorder(node.right);
  }

  inorder(root);
  for (var i = 1; i < values.length; i++) {
    if (values[i] <= values[i - 1]) return false;
  }
  return true;
}
