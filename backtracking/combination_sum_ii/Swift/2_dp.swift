class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // sums[s] = distinct combinations (sorted) that add up to s
        var sums = Array(repeating: [[Int]](), count: target + 1)
        // seen[s] remembers what is already stored, to drop duplicates
        var seen = Array(repeating: Set<[Int]>(), count: target + 1)
        sums[0] = [[]]
        seen[0] = [[]]

        for x in candidates.sorted() {
            // Go downward so each candidate is used at most once
            for s in stride(from: target, through: x, by: -1) {
                for combo in sums[s - x] {
                    let next = combo + [x]
                    if seen[s].insert(next).inserted {
                        sums[s].append(next)
                    }
                }
            }
        }
        return sums[target]
    }
}
