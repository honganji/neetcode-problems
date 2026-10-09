// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

int kthSmallest(TreeNode? root, int k) {
  var count = 0;
  var result = -1;

  void inorder(TreeNode? node) {
    if (node == null || result != -1) {
      return;
    }
    inorder(node.left);
    if (result != -1) {
      return;
    }
    count++;
    if (count == k) {
      result = node.val;
      return;
    }
    inorder(node.right);
  }

  inorder(root);
  return result;
}
