func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var result: [[Int]] = []
    var path: [Int] = []

    func backtrack(_ start: Int) {
        result.append(path)
        for i in start..<sorted.count {
            // Equal values next to each other: only the first one may start a branch here.
            if i > start && sorted[i] == sorted[i - 1] { continue }
            path.append(sorted[i])
            backtrack(i + 1)
            path.removeLast()
        }
    }

    backtrack(0)
    return result
}
