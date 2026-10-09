fun mergeTriplets(triplets: Array<IntArray>, target: IntArray): Boolean {
    var bestA = 0
    var bestB = 0
    var bestC = 0
    for (t in triplets) {
        // A triplet larger than the target in any position can never be used.
        if (t[0] <= target[0] && t[1] <= target[1] && t[2] <= target[2]) {
            bestA = maxOf(bestA, t[0])
            bestB = maxOf(bestB, t[1])
            bestC = maxOf(bestC, t[2])
        }
    }
    return bestA == target[0] && bestB == target[1] && bestC == target[2]
}
