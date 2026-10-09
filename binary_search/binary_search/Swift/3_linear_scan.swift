func search(_ nums: [Int], _ target: Int) -> Int {
    for (i, num) in nums.enumerated() {
        if num == target {
            return i
        }
        if num > target {
            return -1
        }
    }
    return -1
}
