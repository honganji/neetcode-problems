class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    final n = gas.length;

    for (var start = 0; start < n; start++) {
      var tank = 0;
      var completed = true;
      for (var step = 0; step < n; step++) {
        final i = (start + step) % n;
        tank += gas[i] - cost[i];
        if (tank < 0) {
          completed = false; // ran out of fuel, try the next start
          break;
        }
      }
      if (completed) {
        return start; // completed the whole lap
      }
    }

    return -1;
  }
}
