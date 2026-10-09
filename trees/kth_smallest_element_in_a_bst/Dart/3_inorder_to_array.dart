// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int kthSmallest(TreeNode? root, int k) {
  final values = <int>[];

  void inorder(TreeNode? node) {
    if (node == null) {
      return;
    }
    inorder(node.left);
    values.add(node.val);
    inorder(node.right);
  }

  inorder(root);
  return values[k - 1];
}
