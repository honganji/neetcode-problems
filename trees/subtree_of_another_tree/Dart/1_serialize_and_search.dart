// LeetCode provides this definition.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isSubtree(TreeNode? root, TreeNode? subRoot) {
  String serialize(TreeNode? node) {
    final buffer = StringBuffer();
    void walk(TreeNode? current) {
      if (current == null) {
        buffer.write(',N');
        return;
      }
      buffer.write(',#${current.val}');
      walk(current.left);
      walk(current.right);
    }

    walk(node);
    return buffer.toString();
  }

  bool kmpContains(String text, String pattern) {
    final p = pattern.codeUnits;
    final t = text.codeUnits;
    final failure = List<int>.filled(p.length, 0);
    var k = 0;
    for (var i = 1; i < p.length; i++) {
      while (k > 0 && p[i] != p[k]) {
        k = failure[k - 1];
      }
      if (p[i] == p[k]) {
        k++;
      }
      failure[i] = k;
    }
    k = 0;
    for (final ch in t) {
      while (k > 0 && ch != p[k]) {
        k = failure[k - 1];
      }
      if (ch == p[k]) {
        k++;
      }
      if (k == p.length) {
        return true;
      }
    }
    return false;
  }

  return kmpContains(serialize(root), serialize(subRoot));
}
