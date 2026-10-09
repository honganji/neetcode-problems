fun minEatingSpeed(piles: IntArray, h: Int): Int {
    var k = 1
    while (true) {
        var hours = 0L
        for (pile in piles) {
            hours += (pile + k - 1) / k
            if (hours > h) break
        }
        if (hours <= h) return k
        k++
    }
}
