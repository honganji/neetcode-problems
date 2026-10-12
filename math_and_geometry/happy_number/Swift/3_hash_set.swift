func isHappy(_ n: Int) -> Bool {
    // If we ever repeat a number, the chain is looping and can never reach 1.
    var seen = Set<Int>()
    var current = n
    while current != 1 {
        if seen.contains(current) { return false }
        seen.insert(current)
        current = digitSquareSum(current)
    }
    return true
}

private func digitSquareSum(_ n: Int) -> Int {
    var rest = n
    var total = 0
    while rest > 0 {
        let digit = rest % 10
        total += digit * digit
        rest /= 10
    }
    return total
}
