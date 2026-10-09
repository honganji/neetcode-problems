// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  final indexOf = <int, int>{};
  for (var i = 0; i < inorder.length; i++) {
    indexOf[inorder[i]] = i;
  }
  var prePos = 0;

  TreeNode? build(int lo, int hi) {
    if (lo > hi) return null;
    final val = preorder[prePos++];
    final node = TreeNode(val);
    final mid = indexOf[val]!;
    node.left = build(lo, mid - 1);
    node.right = build(mid + 1, hi);
    return node;
  }

  return build(0, inorder.length - 1);
}
