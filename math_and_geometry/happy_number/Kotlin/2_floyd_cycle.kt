fun isHappy(n: Int): Boolean {
    // Treat the chain of numbers like a linked list. slow moves one step, fast moves two.
    // A happy chain ends at the fixed point 1; an unhappy chain loops, so fast catches slow.
    var slow = n
    var fast = digitSquareSum(n)
    while (fast != 1 && slow != fast) {
        slow = digitSquareSum(slow)
        fast = digitSquareSum(digitSquareSum(fast))
    }
    return fast == 1
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
