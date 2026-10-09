class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let n = candidates.count
        var seen = Set<[Int]>()
        var result: [[Int]] = []

        // Each mask is one subset: bit i set means candidates[i] is used
        for mask in 1..<(1 << n) {
            var combo: [Int] = []
            var total = 0
            for i in 0..<n where ((mask >> i) & 1) == 1 {
                combo.append(candidates[i])
                total += candidates[i]
            }
            if total != target { continue }
            let sorted = combo.sorted()
            if seen.insert(sorted).inserted {
                result.append(sorted)
            }
        }
        return result
    }
}
