// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  if (preorder.isEmpty) return null;
  final rootVal = preorder[0];
  final mid = inorder.indexOf(rootVal);
  final root = TreeNode(rootVal);
  root.left = buildTree(preorder.sublist(1, mid + 1), inorder.sublist(0, mid));
  root.right = buildTree(preorder.sublist(mid + 1), inorder.sublist(mid + 1));
  return root;
}
