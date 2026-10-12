fun multiply(num1: String, num2: String): String {
    if (num1 == "0" || num2 == "0") return "0"

    val m = num1.length
    val n = num2.length
    // result[k] collects the products that land at place k, counted from the left.
    val result = IntArray(m + n)
    for (i in m - 1 downTo 0) {
        for (j in n - 1 downTo 0) {
            // Digit i of num1 times digit j of num2 lands at places i+j and i+j+1.
            val total = (num1[i] - '0') * (num2[j] - '0') + result[i + j + 1]
            result[i + j + 1] = total % 10
            result[i + j] += total / 10
        }
    }

    var start = 0
    while (start < result.size - 1 && result[start] == 0) start++
    return result.drop(start).joinToString("")
}
