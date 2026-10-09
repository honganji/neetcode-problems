func search(_ nums: [Int], _ target: Int) -> Int {
    for (i, num) in nums.enumerated() {
        if num == target {
            return i
        }
    }
    return -1
}
