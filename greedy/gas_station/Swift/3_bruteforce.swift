class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count

        for start in 0..<n {
            var tank = 0
            var completed = true
            for step in 0..<n {
                let i = (start + step) % n
                tank += gas[i] - cost[i]
                if tank < 0 {
                    completed = false  // ran out of fuel, try the next start
                    break
                }
            }
            if completed {
                return start  // completed the whole lap
            }
        }

        return -1
    }
}
