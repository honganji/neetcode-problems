func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    func fewest(_ remaining: Int) -> Int {
        if remaining == 0 { return 0 }
        var best = -1
        for c in coins where c <= remaining {
            let sub = fewest(remaining - c)
            if sub != -1 && (best == -1 || sub + 1 < best) { best = sub + 1 }
        }
        return best
    }

    return fewest(amount)
}
