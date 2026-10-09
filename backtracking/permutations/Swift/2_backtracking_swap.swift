func permute(_ nums: [Int]) -> [[Int]] {
    var arr = nums
    var result: [[Int]] = []

    func backtrack(_ start: Int) {
        // Everything before `start` is fixed; try each remaining value at `start`
        if start == arr.count {
            result.append(arr)
            return
        }
        for i in start..<arr.count {
            arr.swapAt(start, i)  // choose
            backtrack(start + 1)  // explore
            arr.swapAt(start, i)  // undo
        }
    }

    backtrack(0)
    return result
}
