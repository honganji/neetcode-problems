// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  if (preorder.isEmpty) return null;
  final root = TreeNode(preorder[0]);
  final stack = <TreeNode>[root];
  var inPos = 0;
  for (var i = 1; i < preorder.length; i++) {
    final node = TreeNode(preorder[i]);
    if (stack.last.val != inorder[inPos]) {
      stack.last.left = node;
    } else {
      var parent = stack.last;
      while (stack.isNotEmpty && stack.last.val == inorder[inPos]) {
        parent = stack.removeLast();
        inPos++;
      }
      parent.right = node;
    }
    stack.add(node);
  }
  return root;
}
