class Solution {
  List<List<String>> partition(String s) {
    final n = s.length;
    // partitions[i] holds every way to split the first i characters.
    final partitions = List.generate(n + 1, (_) => <List<String>>[]);
    partitions[0].add(<String>[]);

    for (var end = 1; end <= n; end++) {
      for (var start = 0; start < end; start++) {
        if (!_isPalindrome(s, start, end - 1)) continue;
        final last = s.substring(start, end);
        for (final prefix in partitions[start]) {
          partitions[end].add([...prefix, last]);
        }
      }
    }
    return partitions[n];
  }

  bool _isPalindrome(String s, int l, int r) {
    while (l < r) {
      if (s[l] != s[r]) return false;
      l++;
      r--;
    }
    return true;
  }
}
