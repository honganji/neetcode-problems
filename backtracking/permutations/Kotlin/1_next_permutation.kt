fun permute(nums: IntArray): List<List<Int>> {
    val arr = nums.sortedArray()  // start from the smallest arrangement
    val result = mutableListOf(arr.toList())

    while (true) {
        // Find the rightmost i where arr[i] < arr[i + 1]
        var i = arr.size - 2
        while (i >= 0 && arr[i] > arr[i + 1]) i--
        if (i < 0) return result  // fully descending: this was the last permutation

        // Find the rightmost j where arr[j] > arr[i]
        var j = arr.size - 1
        while (arr[j] < arr[i]) j--
        swap(arr, i, j)

        // Reverse the suffix so it is in its smallest order
        arr.reverse(i + 1, arr.size)
        result.add(arr.toList())
    }
}

private fun swap(arr: IntArray, i: Int, j: Int) {
    val tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
}
