fun maxProfit(prices: IntArray): Int {
    var best = 0
    for (i in prices.indices) {
        for (j in i + 1 until prices.size) {
            best = maxOf(best, prices[j] - prices[i])
        }
    }
    return best
}
