func subsets(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = [[]]
    for num in nums {
        // Each existing subset gets a copy with num added to it.
        let copies = result.map { $0 + [num] }
        result += copies
    }
    return result
}
