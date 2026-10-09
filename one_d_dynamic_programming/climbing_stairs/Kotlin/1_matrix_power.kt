class Solution {
    fun climbStairs(n: Int): Int {
        // [[1, 1], [1, 0]] raised to the n-th power holds Fibonacci numbers.
        // Long avoids overflow in the intermediate squares.
        var result = arrayOf(longArrayOf(1, 0), longArrayOf(0, 1))  // identity matrix
        var base = arrayOf(longArrayOf(1, 1), longArrayOf(1, 0))
        var power = n
        while (power > 0) {
            if (power % 2 == 1) result = multiply(result, base)
            base = multiply(base, base)  // square: M^1, M^2, M^4, ...
            power /= 2
        }
        return result[0][0].toInt()
    }

    private fun multiply(a: Array<LongArray>, b: Array<LongArray>): Array<LongArray> {
        return arrayOf(
            longArrayOf(a[0][0] * b[0][0] + a[0][1] * b[1][0], a[0][0] * b[0][1] + a[0][1] * b[1][1]),
            longArrayOf(a[1][0] * b[0][0] + a[1][1] * b[1][0], a[1][0] * b[0][1] + a[1][1] * b[1][1])
        )
    }
}
