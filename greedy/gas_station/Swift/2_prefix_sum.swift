class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var balance = 0            // running sum of gas[i] - cost[i]
        var minBalance = Int.max   // lowest balance seen so far
        var start = 0

        for i in gas.indices {
            balance += gas[i] - cost[i]
            if balance < minBalance {
                // Starting right after the lowest point keeps the tank
                // from ever dipping below zero.
                minBalance = balance
                start = (i + 1) % gas.count
            }
        }

        // The final balance is the total surplus; if it is negative, no
        // start works.
        return balance >= 0 ? start : -1
    }
}
