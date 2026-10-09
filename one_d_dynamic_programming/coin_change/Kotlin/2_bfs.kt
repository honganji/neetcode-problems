fun coinChange(coins: IntArray, amount: Int): Int {
    if (amount == 0) return 0
    // Each queue level is "one more coin used"; the first time we reach amount, it's the fewest
    val seen = BooleanArray(amount + 1)
    seen[0] = true
    val queue = ArrayDeque<Int>()
    queue.addLast(0)
    var coinsUsed = 0
    while (queue.isNotEmpty()) {
        coinsUsed++
        repeat(queue.size) {
            val total = queue.removeFirst()
            for (c in coins) {
                if (c > amount - total) continue  // would overshoot
                val next = total + c
                if (next == amount) return coinsUsed
                if (!seen[next]) {
                    seen[next] = true
                    queue.addLast(next)
                }
            }
        }
    }
    return -1
}
