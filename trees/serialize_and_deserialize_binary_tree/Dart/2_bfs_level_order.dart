import 'dart:collection';

// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Codec {
  String serialize(TreeNode? root) {
    if (root == null) return '';
    final tokens = <String>[];
    final queue = ListQueue<TreeNode?>()..add(root);
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      if (node == null) {
        tokens.add('N');
        continue;
      }
      tokens.add(node.val.toString());
      queue.add(node.left);
      queue.add(node.right);
    }
    return tokens.join(',');
  }

  TreeNode? deserialize(String data) {
    if (data.isEmpty) return null;
    final tokens = data.split(',');
    final root = TreeNode(int.parse(tokens[0]));
    final queue = ListQueue<TreeNode>()..add(root);
    var i = 1;
    while (queue.isNotEmpty && i < tokens.length) {
      final node = queue.removeFirst();
      if (tokens[i] != 'N') {
        node.left = TreeNode(int.parse(tokens[i]));
        queue.add(node.left!);
      }
      i++;
      if (i < tokens.length && tokens[i] != 'N') {
        node.right = TreeNode(int.parse(tokens[i]));
        queue.add(node.right!);
      }
      i++;
    }
    return root;
  }
}
