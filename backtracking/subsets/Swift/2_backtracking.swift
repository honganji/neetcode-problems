func subsets(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    var path: [Int] = []

    func backtrack(_ start: Int) {
        result.append(path)
        for i in start..<nums.count {
            path.append(nums[i])
            backtrack(i + 1)
            path.removeLast()
        }
    }

    backtrack(0)
    return result
}
