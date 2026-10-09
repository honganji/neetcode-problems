fun maxProfit(prices: IntArray): Int {
    var minPrice = prices[0]
    var best = 0
    for (price in prices) {
        if (price < minPrice) {
            minPrice = price
        } else {
            best = maxOf(best, price - minPrice)
        }
    }
    return best
}
