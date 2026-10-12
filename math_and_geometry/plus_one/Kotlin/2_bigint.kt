import java.math.BigInteger

fun plusOne(digits: IntArray): IntArray {
    // BigInteger has no size limit, so join the digits into one number and add 1.
    val number = BigInteger(digits.joinToString("")).add(BigInteger.ONE)
    return number.toString().map { it - '0' }.toIntArray()
}
