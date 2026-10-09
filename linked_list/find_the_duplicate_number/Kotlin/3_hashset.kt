fun findDuplicate(nums: IntArray): Int {
    val seen = HashSet<Int>()
    for (num in nums) {
        if (!seen.add(num)) {
            return num
        }
    }
    return -1
}
