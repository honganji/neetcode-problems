func containsDuplicate(_ nums: [Int]) -> Bool {
    let sorted = nums.sorted()
    for i in 1..<sorted.count {
        if sorted[i] == sorted[i - 1] {
            return true
        }
    }
    return false
}
