// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isSubtree(TreeNode? root, TreeNode? subRoot) {
  String buildKeys(TreeNode? node, Map<TreeNode, String> keys) {
    if (node == null) {
      return 'N';
    }
    final leftKey = buildKeys(node.left, keys);
    final rightKey = buildKeys(node.right, keys);
    final key = '(#${node.val}$leftKey$rightKey)';
    keys[node] = key;
    return key;
  }

  final target = buildKeys(subRoot, <TreeNode, String>{});
  if (subRoot == null) {
    return true;
  }
  final rootKeys = <TreeNode, String>{};
  buildKeys(root, rootKeys);
  return rootKeys.values.any((key) => key == target);
}
