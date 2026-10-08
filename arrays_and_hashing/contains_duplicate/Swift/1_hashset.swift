func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if !seen.insert(num).inserted {
            return true
        }
    }
    return false
}
