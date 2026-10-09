List<List<int>> permute(List<int> nums) {
  var perms = <List<int>>[[]];
  for (final num in nums) {
    final nextPerms = <List<int>>[];
    for (final perm in perms) {
      // Insert num at every possible position of each existing permutation
      for (var i = 0; i <= perm.length; i++) {
        nextPerms.add([...perm.sublist(0, i), num, ...perm.sublist(i)]);
      }
    }
    perms = nextPerms;
  }
  return perms;
}
