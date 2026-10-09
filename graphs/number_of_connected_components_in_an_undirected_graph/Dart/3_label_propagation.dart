class Solution {
  int countComponents(int n, List<List<int>> edges) {
    // Every node starts out labeled with its own number.
    final label = List<int>.generate(n, (i) => i);

    // Keep letting edge endpoints adopt the smaller label until nothing changes.
    var changed = true;
    while (changed) {
      changed = false;
      for (final edge in edges) {
        final a = edge[0];
        final b = edge[1];
        final low = label[a] < label[b] ? label[a] : label[b];
        if (label[a] != low || label[b] != low) {
          label[a] = low;
          label[b] = low;
          changed = true;
        }
      }
    }

    // Each component ends up labeled with its smallest node,
    // so the nodes still holding their own number are one per component.
    var components = 0;
    for (var i = 0; i < n; i++) {
      if (label[i] == i) components++;
    }
    return components;
  }
}
