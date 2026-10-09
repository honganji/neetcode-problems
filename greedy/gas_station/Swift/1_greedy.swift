class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalSurplus = 0  // total gas - total cost over the whole circle
        var tank = 0          // fuel left while driving from the current start
        var start = 0

        for i in gas.indices {
            let diff = gas[i] - cost[i]
            totalSurplus += diff
            tank += diff
            if tank < 0 {
                // Can't get from `start` to station i + 1, so no station
                // between `start` and i can work. Try the next one.
                start = i + 1
                tank = 0
            }
        }

        return totalSurplus >= 0 ? start : -1
    }
}
