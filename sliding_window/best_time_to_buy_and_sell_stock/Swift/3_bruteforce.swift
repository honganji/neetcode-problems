func maxProfit(_ prices: [Int]) -> Int {
    var best = 0
    for i in 0..<prices.count {
        for j in (i + 1)..<prices.count {
            best = max(best, prices[j] - prices[i])
        }
    }
    return best
}
