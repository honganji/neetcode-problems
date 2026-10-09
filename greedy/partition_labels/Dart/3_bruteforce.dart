class Solution {
  List<int> partitionLabels(String s) {
    final result = <int>[];
    var start = 0;

    while (start < s.length) {
      // Find the earliest end where no letter in the part appears later.
      var end = start;
      while (_crossesCut(s, start, end)) {
        end++;
      }
      result.add(end - start + 1);
      start = end + 1;
    }
    return result;
  }

  bool _crossesCut(String s, int start, int end) {
    final after = s.substring(end + 1);
    for (var i = start; i <= end; i++) {
      if (after.contains(s[i])) return true;
    }
    return false;
  }
}
