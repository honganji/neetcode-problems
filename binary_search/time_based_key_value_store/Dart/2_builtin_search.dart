class TimeMap {
  final Map<String, List<int>> _timestamps = {};
  final Map<String, List<String>> _values = {};

  TimeMap();

  void set(String key, String value, int timestamp) {
    _timestamps.putIfAbsent(key, () => []).add(timestamp);
    _values.putIfAbsent(key, () => []).add(value);
  }

  String get(String key, int timestamp) {
    final stamps = _timestamps[key];
    if (stamps == null || stamps.isEmpty) {
      return '';
    }
    final index = _upperBound(stamps, timestamp);
    if (index == 0) {
      return '';
    }
    return _values[key]![index - 1];
  }

  int _upperBound(List<int> sorted, int target) {
    var low = 0;
    var high = sorted.length;
    while (low < high) {
      final mid = (low + high) ~/ 2;
      if (sorted[mid] <= target) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }
}
