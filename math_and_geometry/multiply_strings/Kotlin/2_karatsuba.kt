fun multiply(num1: String, num2: String): String = karatsuba(num1, num2)

private fun karatsuba(a: String, b: String): String {
    if (a == "0" || b == "0") return "0"
    if (a.length == 1 && b.length == 1) return (a.toInt() * b.toInt()).toString()

    // Split both numbers at the same place m from the right: x = high * 10^m + low.
    val m = maxOf(a.length, b.length) / 2
    val aHigh = if (a.length > m) a.substring(0, a.length - m) else "0"
    val aLow = strip(if (a.length > m) a.substring(a.length - m) else a)
    val bHigh = if (b.length > m) b.substring(0, b.length - m) else "0"
    val bLow = strip(if (b.length > m) b.substring(b.length - m) else b)

    // Only three recursive products are needed instead of four.
    val zHigh = karatsuba(aHigh, bHigh)
    val zLow = karatsuba(aLow, bLow)
    // (aHigh + aLow)(bHigh + bLow) contains the cross terms, and subtracting the others leaves them.
    val zMid = sub(sub(karatsuba(add(aHigh, aLow), add(bHigh, bLow)), zHigh), zLow)

    return add(add(shift(zHigh, 2 * m), shift(zMid, m)), zLow)
}

private fun strip(s: String): String {
    var i = 0
    while (i < s.length - 1 && s[i] == '0') i++
    return s.substring(i)
}

private fun shift(s: String, k: Int): String =
    // Multiplying by 10^k appends k zeros.
    if (s == "0") s else s + "0".repeat(k)

private fun add(a: String, b: String): String {
    val digits = StringBuilder()
    var carry = 0
    var i = a.length - 1
    var j = b.length - 1
    while (i >= 0 || j >= 0 || carry > 0) {
        var total = carry
        if (i >= 0) total += a[i--] - '0'
        if (j >= 0) total += b[j--] - '0'
        digits.append(total % 10)
        carry = total / 10
    }
    return digits.reverse().toString()
}

private fun sub(a: String, b: String): String {
    // Requires a >= b.
    val digits = StringBuilder()
    var borrow = 0
    var i = a.length - 1
    var j = b.length - 1
    while (i >= 0) {
        var diff = (a[i] - '0') - borrow
        i--
        if (j >= 0) {
            diff -= b[j] - '0'
            j--
        }
        borrow = if (diff < 0) 1 else 0
        digits.append(if (diff < 0) diff + 10 else diff)
    }
    return strip(digits.reverse().toString())
}
