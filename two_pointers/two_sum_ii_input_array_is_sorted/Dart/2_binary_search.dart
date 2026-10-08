List<int> twoSum(List<int> numbers, int target) {
  for (var i = 0; i < numbers.length; i++) {
    final complement = target - numbers[i];
    var low = i + 1;
    var high = numbers.length - 1;
    while (low <= high) {
      final mid = low + (high - low) ~/ 2;
      if (numbers[mid] == complement) {
        return [i + 1, mid + 1];
      }
      if (numbers[mid] < complement) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
  }
  return [];
}
