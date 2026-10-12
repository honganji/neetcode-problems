import kotlin.math.abs
import kotlin.math.exp
import kotlin.math.ln

fun myPow(x: Double, n: Int): Double {
    if (n == 0) return 1.0
    if (x == 0.0) return if (n > 0) 0.0 else Double.POSITIVE_INFINITY

    // x^n = e^(n * ln|x|), so the power becomes one multiply and one exp.
    val magnitude = exp(n * ln(abs(x)))
    // An odd power of a negative number stays negative.
    val negative = x < 0 && n % 2 != 0
    return if (negative) -magnitude else magnitude
}
