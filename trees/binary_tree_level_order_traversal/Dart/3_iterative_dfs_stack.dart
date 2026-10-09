// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

List<List<int>> levelOrder(TreeNode? root) {
  final result = <List<int>>[];
  if (root == null) return result;
  final stack = <(TreeNode, int)>[(root, 0)];
  while (stack.isNotEmpty) {
    final (node, depth) = stack.removeLast();
    if (depth == result.length) result.add(<int>[]);
    result[depth].add(node.val);
    if (node.right != null) stack.add((node.right!, depth + 1));
    if (node.left != null) stack.add((node.left!, depth + 1));
  }
  return result;
}
