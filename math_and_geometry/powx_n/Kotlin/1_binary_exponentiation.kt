fun myPow(x: Double, n: Int): Double {
    // A negative power is the reciprocal of the positive power.
    var base = if (n < 0) 1.0 / x else x
    var remaining = kotlin.math.abs(n.toLong())
    var result = 1.0

    while (remaining > 0) {
        // If the lowest bit is set, this power of base is part of the answer.
        if (remaining % 2 == 1L) result *= base
        // Squaring base doubles the exponent it represents.
        base *= base
        remaining /= 2
    }
    return result
}
