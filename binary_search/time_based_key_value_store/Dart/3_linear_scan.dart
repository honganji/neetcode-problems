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
    if (stamps == null) {
      return '';
    }
    final values = _values[key]!;
    for (var i = stamps.length - 1; i >= 0; i--) {
      if (stamps[i] <= timestamp) {
        return values[i];
      }
    }
    return '';
  }
}
