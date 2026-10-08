func largestRectangleArea(_ heights: [Int]) -> Int {
    var best = 0
    var stack = [(index: Int, height: Int)]()
    for (i, height) in heights.enumerated() {
        var start = i
        while let top = stack.last, top.height > height {
            stack.removeLast()
            best = max(best, top.height * (i - top.index))
            start = top.index
        }
        stack.append((index: start, height: height))
    }
    for entry in stack {
        best = max(best, entry.height * (heights.count - entry.index))
    }
    return best
}
