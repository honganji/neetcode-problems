import kotlin.random.Random

fun findKthLargest(nums: IntArray, k: Int): Int {
    // In sorted order, the kth largest sits at index size - k.
    val target = nums.size - k
    var lo = 0
    var hi = nums.size - 1
    while (true) {
        val pivot = nums[Random.nextInt(lo, hi + 1)]
        // 3-way partition: smaller values left, equal values in the middle, larger right.
        var lt = lo
        var i = lo
        var gt = hi
        while (i <= gt) {
            when {
                nums[i] < pivot -> {
                    swap(nums, lt, i)
                    lt++
                    i++
                }
                nums[i] > pivot -> {
                    swap(nums, i, gt)
                    gt--
                }
                else -> i++
            }
        }
        // Only one side can contain the target, so keep searching just that side.
        when {
            target < lt -> hi = lt - 1
            target > gt -> lo = gt + 1
            else -> return pivot
        }
    }
}

private fun swap(a: IntArray, i: Int, j: Int) {
    val t = a[i]
    a[i] = a[j]
    a[j] = t
}
