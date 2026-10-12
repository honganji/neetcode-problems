fun isHappy(n: Int): Boolean {
    // Every unhappy number gets stuck in the loop 4 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4,
    // so we can stop as soon as we reach 1 (happy) or 4 (unhappy).
    var current = n
    while (current != 1 && current != 4) {
        current = digitSquareSum(current)
    }
    return current == 1
}

private fun digitSquareSum(n: Int): Int {
    var rest = n
    var total = 0
    while (rest > 0) {
        val digit = rest % 10
        total += digit * digit
        rest /= 10
    }
    return total
}
