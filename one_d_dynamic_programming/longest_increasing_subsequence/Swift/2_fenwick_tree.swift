class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // Compress values to ranks 1...m so they can index the Fenwick tree.
        let sortedUnique = Array(Set(nums)).sorted()
        var rank: [Int: Int] = [:]
        for (i, v) in sortedUnique.enumerated() {
            rank[v] = i + 1
        }
        let m = sortedUnique.count
        // tree[i] holds the best subsequence length over a range of ranks.
        var tree = [Int](repeating: 0, count: m + 1)

        var best = 0
        for x in nums {
            let r = rank[x]!

            // Best length among smaller values (ranks 1..r-1).
            var cur = 0
            var i = r - 1
            while i > 0 {
                cur = max(cur, tree[i])
                i -= i & -i
            }

            let length = cur + 1

            // Record this length at rank r.
            i = r
            while i <= m {
                tree[i] = max(tree[i], length)
                i += i & -i
            }

            best = max(best, length)
        }
        return best
    }
}
