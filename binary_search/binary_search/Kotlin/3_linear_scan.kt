fun search(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target) {
            return i
        }
        if (nums[i] > target) {
            return -1
        }
    }
    return -1
}
