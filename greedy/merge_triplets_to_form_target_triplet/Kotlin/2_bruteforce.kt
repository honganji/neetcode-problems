fun mergeTriplets(triplets: Array<IntArray>, target: IntArray): Boolean {
    val n = triplets.size
    // Try every choice of up to three triplets (repeats allowed).
    for (i in 0 until n) {
        for (j in 0 until n) {
            for (k in 0 until n) {
                val a = maxOf(triplets[i][0], triplets[j][0], triplets[k][0])
                val b = maxOf(triplets[i][1], triplets[j][1], triplets[k][1])
                val c = maxOf(triplets[i][2], triplets[j][2], triplets[k][2])
                if (a == target[0] && b == target[1] && c == target[2]) {
                    return true
                }
            }
        }
    }
    return false
}
