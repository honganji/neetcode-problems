fun dailyTemperatures(temperatures: IntArray): IntArray {
    val n = temperatures.size
    val answer = IntArray(n)
    for (i in 0 until n) {
        for (j in i + 1 until n) {
            if (temperatures[j] > temperatures[i]) {
                answer[i] = j - i
                break
            }
        }
    }
    return answer
}
