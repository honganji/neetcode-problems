class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    var totalSurplus = 0; // total gas - total cost over the whole circle
    var tank = 0; // fuel left while driving from the current start
    var start = 0;

    for (var i = 0; i < gas.length; i++) {
      final diff = gas[i] - cost[i];
      totalSurplus += diff;
      tank += diff;
      if (tank < 0) {
        // Can't get from `start` to station i + 1, so no station
        // between `start` and i can work. Try the next one.
        start = i + 1;
        tank = 0;
      }
    }

    return totalSurplus >= 0 ? start : -1;
  }
}
