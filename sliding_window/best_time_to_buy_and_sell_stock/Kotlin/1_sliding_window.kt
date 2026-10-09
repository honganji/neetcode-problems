fun maxProfit(prices: IntArray): Int {
    var left = 0
    var right = 1
    var best = 0
    while (right < prices.size) {
        if (prices[right] < prices[left]) {
            left = right
        } else {
            best = maxOf(best, prices[right] - prices[left])
        }
        right++
    }
    return best
}
