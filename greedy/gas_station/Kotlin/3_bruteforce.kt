class Solution {
    fun canCompleteCircuit(gas: IntArray, cost: IntArray): Int {
        val n = gas.size

        for (start in 0 until n) {
            var tank = 0
            var completed = true
            for (step in 0 until n) {
                val i = (start + step) % n
                tank += gas[i] - cost[i]
                if (tank < 0) {
                    completed = false  // ran out of fuel, try the next start
                    break
                }
            }
            if (completed) {
                return start  // completed the whole lap
            }
        }

        return -1
    }
}
