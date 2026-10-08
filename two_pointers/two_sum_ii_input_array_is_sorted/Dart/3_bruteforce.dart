List<int> twoSum(List<int> numbers, int target) {
  for (var i = 0; i < numbers.length; i++) {
    for (var j = i + 1; j < numbers.length; j++) {
      if (numbers[i] + numbers[j] == target) {
        return [i + 1, j + 1];
      }
    }
  }
  return [];
}
