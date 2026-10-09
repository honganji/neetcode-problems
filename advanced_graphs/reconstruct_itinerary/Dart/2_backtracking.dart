class Solution {
  List<String> findItinerary(List<List<String>> tickets) {
    final graph = <String, List<String>>{};
    for (final ticket in tickets) {
      graph.putIfAbsent(ticket[0], () => []).add(ticket[1]);
    }
    for (final destinations in graph.values) {
      destinations.sort(); // smallest first
    }

    final route = <String>['JFK'];
    final total = tickets.length + 1;

    bool dfs(String current) {
      if (route.length == total) return true;
      final destinations = graph[current];
      if (destinations == null) return false;
      for (var i = 0; i < destinations.length; i++) {
        final next = destinations.removeAt(i); // use this ticket
        route.add(next);
        if (dfs(next)) return true;
        route.removeLast(); // undo and try the next option
        destinations.insert(i, next);
      }
      return false;
    }

    dfs('JFK');
    return route;
  }
}
