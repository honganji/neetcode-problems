// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Codec {
  String serialize(TreeNode? root) {
    final tokens = <String>[];

    void dfs(TreeNode? node) {
      if (node == null) {
        tokens.add('N');
        return;
      }
      dfs(node.left);
      dfs(node.right);
      tokens.add(node.val.toString());
    }

    dfs(root);
    return tokens.join(',');
  }

  TreeNode? deserialize(String data) {
    final tokens = data.split(',');
    var index = tokens.length - 1;

    TreeNode? build() {
      final token = tokens[index--];
      if (token == 'N') return null;
      final node = TreeNode(int.parse(token));
      node.right = build();
      node.left = build();
      return node;
    }

    return build();
  }
}
