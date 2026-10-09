func findMin(_ nums: [Int]) -> Int {
    for i in 1..<nums.count {
        if nums[i] < nums[i - 1] {
            return nums[i]
        }
    }
    return nums[0]
}
