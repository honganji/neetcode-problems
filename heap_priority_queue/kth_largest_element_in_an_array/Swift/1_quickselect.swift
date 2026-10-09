func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    // Mutable copy, since partitioning reorders the array.
    var nums = nums
    // In sorted order, the kth largest sits at index count - k.
    let target = nums.count - k
    var lo = 0
    var hi = nums.count - 1
    while true {
        let pivot = nums[Int.random(in: lo...hi)]
        // 3-way partition: smaller values left, equal values in the middle, larger right.
        var lt = lo
        var i = lo
        var gt = hi
        while i <= gt {
            if nums[i] < pivot {
                nums.swapAt(lt, i)
                lt += 1
                i += 1
            } else if nums[i] > pivot {
                nums.swapAt(i, gt)
                gt -= 1
            } else {
                i += 1
            }
        }
        // Only one side can contain the target, so keep searching just that side.
        if target < lt {
            hi = lt - 1
        } else if target > gt {
            lo = gt + 1
        } else {
            return pivot
        }
    }
}
