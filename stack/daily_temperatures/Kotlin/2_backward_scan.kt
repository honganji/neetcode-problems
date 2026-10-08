fun dailyTemperatures(temperatures: IntArray): IntArray {
    val n = temperatures.size
    val answer = IntArray(n)
    for (i in n - 2 downTo 0) {
        var j = i + 1
        while (temperatures[j] <= temperatures[i]) {
            if (answer[j] == 0) {
                j = -1
                break
            }
            j += answer[j]
        }
        if (j != -1) {
            answer[i] = j - i
        }
    }
    return answer
}
