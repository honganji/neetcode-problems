func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let sorted = candidates.sorted()
    var result: [[Int]] = []
    var path: [Int] = []

    func backtrack(_ start: Int, _ remaining: Int) {
        if remaining == 0 {
            result.append(path)
            return
        }
        for i in start..<sorted.count {
            let c = sorted[i]
            if c > remaining { break }  // sorted, so every later candidate is too big too
            path.append(c)
            backtrack(i, remaining - c)  // i (not i + 1) allows reuse
            path.removeLast()
        }
    }

    backtrack(0, target)
    return result
}
