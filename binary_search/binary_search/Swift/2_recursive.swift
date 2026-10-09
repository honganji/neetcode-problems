func search(_ nums: [Int], _ target: Int) -> Int {
    func helper(_ low: Int, _ high: Int) -> Int {
        if low > high {
            return -1
        }
        let mid = low + (high - low) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            return helper(mid + 1, high)
        }
        return helper(low, mid - 1)
    }

    return helper(0, nums.count - 1)
}
