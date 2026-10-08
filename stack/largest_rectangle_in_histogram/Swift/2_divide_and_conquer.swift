func largestRectangleArea(_ heights: [Int]) -> Int {
    func solve(_ left: Int, _ right: Int) -> Int {
        if left > right {
            return 0
        }
        var minIndex = left
        var i = left + 1
        while i <= right {
            if heights[i] < heights[minIndex] {
                minIndex = i
            }
            i += 1
        }
        return max(
            heights[minIndex] * (right - left + 1),
            solve(left, minIndex - 1),
            solve(minIndex + 1, right)
        )
    }

    return solve(0, heights.count - 1)
}
