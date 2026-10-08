fun twoSum(numbers: IntArray, target: Int): IntArray {
    for (i in numbers.indices) {
        val complement = target - numbers[i]
        var low = i + 1
        var high = numbers.size - 1
        while (low <= high) {
            val mid = low + (high - low) / 2
            if (numbers[mid] == complement) {
                return intArrayOf(i + 1, mid + 1)
            }
            if (numbers[mid] < complement) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    return intArrayOf()
}
