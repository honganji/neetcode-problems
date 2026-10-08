fun twoSum(numbers: IntArray, target: Int): IntArray {
    for (i in numbers.indices) {
        for (j in i + 1 until numbers.size) {
            if (numbers[i] + numbers[j] == target) {
                return intArrayOf(i + 1, j + 1)
            }
        }
    }
    return intArrayOf()
}
