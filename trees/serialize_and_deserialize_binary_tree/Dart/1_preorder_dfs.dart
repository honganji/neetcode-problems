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
      tokens.add(node.val.toString());
      dfs(node.left);
      dfs(node.right);
    }

    dfs(root);
    return tokens.join(',');
  }

  TreeNode? deserialize(String data) {
    final tokens = data.split(',');
    var index = 0;

    TreeNode? build() {
      final token = tokens[index++];
      if (token == 'N') return null;
      final node = TreeNode(int.parse(token));
      node.left = build();
      node.right = build();
      return node;
    }

    return build();
  }
}
