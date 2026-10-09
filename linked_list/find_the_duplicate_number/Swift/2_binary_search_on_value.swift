func findDuplicate(_ nums: [Int]) -> Int {
    var low = 1
    var high = nums.count - 1
    while low < high {
        let mid = (low + high) / 2
        var count = 0
        for num in nums where num <= mid {
            count += 1
        }
        if count > mid {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
