func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let total = nums.reduce(0, +)
    // Out of reach, or the parity is wrong: no way to hit the target.
    if abs(target) > total || (total + target) % 2 != 0 { return 0 }

    // Numbers given "+" form a group P, the rest get "-":
    // sum(P) - (total - sum(P)) = target, so sum(P) = (total + target) / 2.
    // Counting sign choices is the same as counting subsets with that sum.
    let goal = (total + target) / 2
    var ways = [Int](repeating: 0, count: goal + 1)  // ways[s] = subsets summing to s
    ways[0] = 1  // the empty subset

    for num in nums {
        // Go downward so each number is used at most once.
        for s in stride(from: goal, through: num, by: -1) {
            ways[s] += ways[s - num]
        }
    }

    return ways[goal]
}
