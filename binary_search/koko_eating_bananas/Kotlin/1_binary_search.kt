fun minEatingSpeed(piles: IntArray, h: Int): Int {
    fun canFinish(k: Int): Boolean {
        var hours = 0L
        for (pile in piles) {
            hours += (pile + k - 1) / k
            if (hours > h) return false
        }
        return true
    }

    var low = 1
    var high = piles.max()
    while (low < high) {
        val mid = (low + high) / 2
        if (canFinish(mid)) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
