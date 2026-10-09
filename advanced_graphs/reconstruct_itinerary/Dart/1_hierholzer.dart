class Solution {
  List<String> findItinerary(List<List<String>> tickets) {
    // Destinations sorted in reverse, so removeLast() gives the smallest one.
    final graph = <String, List<String>>{};
    for (final ticket in tickets) {
      graph.putIfAbsent(ticket[0], () => []).add(ticket[1]);
    }
    for (final destinations in graph.values) {
      destinations.sort((a, b) => b.compareTo(a));
    }

    final stack = <String>['JFK'];
    final route = <String>[];
    while (stack.isNotEmpty) {
      final current = stack.last;
      final destinations = graph[current];
      if (destinations != null && destinations.isNotEmpty) {
        stack.add(destinations.removeLast()); // take the smallest unused ticket
      } else {
        route.add(stack.removeLast()); // stuck: this airport goes at the end
      }
    }
    return route.reversed.toList();
  }
}
