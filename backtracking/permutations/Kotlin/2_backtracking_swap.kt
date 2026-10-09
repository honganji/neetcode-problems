fun permute(nums: IntArray): List<List<Int>> {
    val arr = nums.copyOf()
    val result = mutableListOf<List<Int>>()

    fun backtrack(start: Int) {
        // Everything before `start` is fixed; try each remaining value at `start`
        if (start == arr.size) {
            result.add(arr.toList())
            return
        }
        for (i in start until arr.size) {
            swap(arr, start, i)  // choose
            backtrack(start + 1) // explore
            swap(arr, start, i)  // undo
        }
    }

    backtrack(0)
    return result
}

private fun swap(arr: IntArray, i: Int, j: Int) {
    val tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
}
