class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    var balance = 0; // running sum of gas[i] - cost[i]
    num minBalance = double.infinity; // lowest balance seen so far
    var start = 0;

    for (var i = 0; i < gas.length; i++) {
      balance += gas[i] - cost[i];
      if (balance < minBalance) {
        // Starting right after the lowest point keeps the tank
        // from ever dipping below zero.
        minBalance = balance;
        start = (i + 1) % gas.length;
      }
    }

    // The final balance is the total surplus; if it is negative, no
    // start works.
    return balance >= 0 ? start : -1;
  }
}
