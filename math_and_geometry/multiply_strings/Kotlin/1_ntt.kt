const val MOD = 998244353L // prime of the form c * 2^k + 1, so the roots of unity we need exist
const val ROOT = 3L // primitive root modulo MOD

fun multiply(num1: String, num2: String): String {
    if (num1 == "0" || num2 == "0") return "0"

    // Little-endian digits: index 0 is the ones place.
    var size = 1
    while (size < num1.length + num2.length) size *= 2
    val a = LongArray(size)
    val b = LongArray(size)
    for (i in num1.indices) a[i] = (num1[num1.length - 1 - i] - '0').toLong()
    for (i in num2.indices) b[i] = (num2[num2.length - 1 - i] - '0').toLong()

    // Multiplying digit lists is a convolution; the transform makes it a pointwise product.
    val fa = ntt(a, false)
    val fb = ntt(b, false)
    val c = ntt(LongArray(size) { fa[it] * fb[it] % MOD }, true)

    // Each position may hold a value above 9, so carry it to the next place.
    val digits = ArrayList<Int>()
    var carry = 0L
    for (value in c) {
        carry += value
        digits.add((carry % 10).toInt())
        carry /= 10
    }
    while (carry > 0) {
        digits.add((carry % 10).toInt())
        carry /= 10
    }

    while (digits.size > 1 && digits.last() == 0) digits.removeAt(digits.size - 1)
    return digits.reversed().joinToString("")
}

private fun ntt(arr: LongArray, invert: Boolean): LongArray {
    val n = arr.size
    // Reorder entries into bit-reversed order.
    var j = 0
    for (i in 1 until n) {
        var bit = n shr 1
        while ((j and bit) != 0) {
            j = j xor bit
            bit = bit shr 1
        }
        j = j xor bit
        if (i < j) {
            val tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
        }
    }

    var length = 2
    while (length <= n) {
        val half = length / 2
        var w = powMod(ROOT, (MOD - 1) / length)
        if (invert) w = powMod(w, MOD - 2)
        for (start in 0 until n step length) {
            var wn = 1L
            for (k in 0 until half) {
                val u = arr[start + k]
                val v = arr[start + k + half] * wn % MOD
                arr[start + k] = (u + v) % MOD
                arr[start + k + half] = (u - v + MOD) % MOD
                wn = wn * w % MOD
            }
        }
        length *= 2
    }

    if (invert) {
        val invN = powMod(n.toLong(), MOD - 2)
        for (i in 0 until n) arr[i] = arr[i] * invN % MOD
    }
    return arr
}

private fun powMod(base: Long, exp: Long): Long {
    var result = 1L
    var b = base % MOD
    var e = exp
    while (e > 0) {
        if ((e and 1L) == 1L) result = result * b % MOD
        b = b * b % MOD
        e = e shr 1
    }
    return result
}
