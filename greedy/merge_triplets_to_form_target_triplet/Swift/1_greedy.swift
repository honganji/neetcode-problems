func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
    var bestA = 0
    var bestB = 0
    var bestC = 0
    for t in triplets where t[0] <= target[0] && t[1] <= target[1] && t[2] <= target[2] {
        // Only triplets that fit under the target can help; keep the max of each position.
        bestA = max(bestA, t[0])
        bestB = max(bestB, t[1])
        bestC = max(bestC, t[2])
    }
    return bestA == target[0] && bestB == target[1] && bestC == target[2]
}
