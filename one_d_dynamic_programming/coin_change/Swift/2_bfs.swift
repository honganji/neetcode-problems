func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 { return 0 }
    // Each queue level is "one more coin used"; the first time we reach amount, it's the fewest
    var seen = [Bool](repeating: false, count: amount + 1)
    seen[0] = true
    var queue = [0]
    var head = 0  // index of the front; avoids the O(n) cost of removeFirst
    var coinsUsed = 0
    while head < queue.count {
        coinsUsed += 1
        let levelEnd = queue.count
        while head < levelEnd {
            let total = queue[head]
            head += 1
            for c in coins {
                if c > amount - total { continue }  // would overshoot
                let next = total + c
                if next == amount { return coinsUsed }
                if !seen[next] {
                    seen[next] = true
                    queue.append(next)
                }
            }
        }
    }
    return -1
}
