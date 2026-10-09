func findDuplicate(_ nums: [Int]) -> Int {
    var seen = Set<Int>()
    for num in nums {
        if !seen.insert(num).inserted {
            return num
        }
    }
    return -1
}
