func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var counts: [Int: Int] = [:]
    for n in nums {
        counts[n, default: 0] += 1
    }

    // For each distinct value, a subset takes 0, 1, ..., count copies of it.
    var result: [[Int]] = [[]]
    for value in counts.keys.sorted() {
        let count = counts[value, default: 0]
        var next: [[Int]] = []
        for subset in result {
            for k in 0...count {
                next.append(subset + Array(repeating: value, count: k))
            }
        }
        result = next
    }
    return result
}
