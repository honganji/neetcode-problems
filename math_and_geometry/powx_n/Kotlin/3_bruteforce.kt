fun myPow(x: Double, n: Int): Double {
    var result = 1.0
    // Multiply x by itself |n| times (Long avoids overflow when n is Int.MIN_VALUE).
    val steps = kotlin.math.abs(n.toLong())
    var i = 0L
    while (i < steps) {
        result *= x
        i++
    }
    return if (n < 0) 1.0 / result else result
}
