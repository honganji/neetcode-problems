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
    final values = _values[key]!;
    var left = 0;
    var right = stamps.length - 1;
    var result = '';
    while (left <= right) {
      final mid = (left + right) ~/ 2;
      if (stamps[mid] <= timestamp) {
        result = values[mid];
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return result;
  }
}
