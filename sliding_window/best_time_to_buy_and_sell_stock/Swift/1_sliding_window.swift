func maxProfit(_ prices: [Int]) -> Int {
    var left = 0
    var right = 1
    var best = 0
    while right < prices.count {
        if prices[right] < prices[left] {
            left = right
        } else {
            best = max(best, prices[right] - prices[left])
        }
        right += 1
    }
    return best
}
