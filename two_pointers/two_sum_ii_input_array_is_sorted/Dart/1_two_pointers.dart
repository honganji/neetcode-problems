List<int> twoSum(List<int> numbers, int target) {
  var left = 0;
  var right = numbers.length - 1;
  while (left < right) {
    final total = numbers[left] + numbers[right];
    if (total == target) {
      return [left + 1, right + 1];
    }
    if (total < target) {
      left++;
    } else {
      right--;
    }
  }
  return [];
}
