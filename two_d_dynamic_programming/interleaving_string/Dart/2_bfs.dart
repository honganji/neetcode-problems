import 'dart:collection';

bool isInterleave(String s1, String s2, String s3) {
  final m = s1.length;
  final n = s2.length;
  if (m + n != s3.length) return false;

  // A state [i, j] means s1[:i] and s2[:j] have been used up to s3[:i + j].
  // Start at [0, 0] and move one step at a time to reach [m, n].
  final seen = List.generate(m + 1, (_) => List<bool>.filled(n + 1, false));
  final queue = Queue<List<int>>()..add([0, 0]);
  seen[0][0] = true;
  while (queue.isNotEmpty) {
    final state = queue.removeFirst();
    final i = state[0];
    final j = state[1];
    if (i == m && j == n) return true;
    final k = i + j;
    if (i < m && s1[i] == s3[k] && !seen[i + 1][j]) {
      seen[i + 1][j] = true;
      queue.add([i + 1, j]);
    }
    if (j < n && s2[j] == s3[k] && !seen[i][j + 1]) {
      seen[i][j + 1] = true;
      queue.add([i, j + 1]);
    }
  }
  return false;
}
