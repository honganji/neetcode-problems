func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = prices[0]
    var best = 0
    for price in prices {
        if price < minPrice {
            minPrice = price
        } else {
            best = max(best, price - minPrice)
        }
    }
    return best
}
