fun isHappy(n: Int): Boolean {
    // If we ever repeat a number, the chain is looping and can never reach 1.
    val seen = mutableSetOf<Int>()
    var current = n
    while (current != 1) {
        if (!seen.add(current)) return false
        current = digitSquareSum(current)
    }
    return true
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
