import 'dart:math';

int minCostClimbingStairs(List<int> cost) {
  // next1: cheapest cost to reach the top from the step after the current one.
  // next2: cheapest cost to reach the top from two steps ahead.
  var next1 = 0; // the top
  var next2 = 0;
  for (var i = cost.length - 1; i >= 0; i--) {
    final cheaper = next1 < next2 ? next1 : next2;
    final int current = cost[i] + cheaper;
    next2 = next1;
    next1 = current;
  }
  // We may start on step 0 or step 1.
  return min(next1, next2);
}
