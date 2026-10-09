class Solution {
  List<String> findItinerary(List<List<String>> tickets) {
    List<String>? best;
    final used = List<bool>.filled(tickets.length, false);
    final order = <int>[];

    // Builds every order of the tickets and checks each one.
    void tryOrders() {
      if (order.length == tickets.length) {
        final path = <String>['JFK'];
        for (final i in order) {
          if (tickets[i][0] != path.last) return; // ticket doesn't continue the trip
          path.add(tickets[i][1]);
        }
        if (best == null || _isSmaller(path, best!)) best = path;
        return;
      }
      for (var i = 0; i < tickets.length; i++) {
        if (used[i]) continue;
        used[i] = true;
        order.add(i);
        tryOrders();
        order.removeLast();
        used[i] = false;
      }
    }

    tryOrders();
    return best!;
  }

  bool _isSmaller(List<String> a, List<String> b) {
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return a[i].compareTo(b[i]) < 0;
    }
    return false;
  }
}
