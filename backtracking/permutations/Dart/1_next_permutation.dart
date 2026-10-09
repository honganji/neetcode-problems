List<List<int>> permute(List<int> nums) {
  final arr = [...nums]..sort(); // start from the smallest arrangement
  final result = <List<int>>[[...arr]];

  while (true) {
    // Find the rightmost i where arr[i] < arr[i + 1]
    var i = arr.length - 2;
    while (i >= 0 && arr[i] > arr[i + 1]) {
      i--;
    }
    if (i < 0) return result; // fully descending: this was the last permutation

    // Find the rightmost j where arr[j] > arr[i]
    var j = arr.length - 1;
    while (arr[j] < arr[i]) {
      j--;
    }
    _swap(arr, i, j);

    // Reverse the suffix so it is in its smallest order
    var lo = i + 1;
    var hi = arr.length - 1;
    while (lo < hi) {
      _swap(arr, lo++, hi--);
    }
    result.add([...arr]);
  }
}

void _swap(List<int> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}
