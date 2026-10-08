List<List<int>> threeSum(List<int> nums) {
  nums.sort();
  final triplets = <String, List<int>>{};
  for (var i = 0; i < nums.length - 2; i++) {
    for (var j = i + 1; j < nums.length - 1; j++) {
      for (var k = j + 1; k < nums.length; k++) {
        if (nums[i] + nums[j] + nums[k] == 0) {
          final triplet = [nums[i], nums[j], nums[k]];
          triplets[triplet.join(',')] = triplet;
        }
      }
    }
  }
  return triplets.values.toList();
}
