import kotlin.math.abs

class Solution {
    fun getSum(a: Int, b: Int): Int {
        var result = a
        // The loop only counts |b| steps; each step does the work with bits.
        repeat(abs(b)) {
            result = if (b > 0) increment(result) else decrement(result)
        }
        return result
    }

    // Turn the trailing 1s into 0s until we reach a 0, then set that 0 to 1.
    private fun increment(x: Int): Int {
        var value = x
        var bit = 1
        while ((value and bit) != 0) {
            value = value xor bit
            bit = bit shl 1
        }
        return value xor bit
    }

    // x - 1 == ~(~x + 1), and inv() is just a bit flip.
    private fun decrement(x: Int): Int = increment(x.inv()).inv()
}
