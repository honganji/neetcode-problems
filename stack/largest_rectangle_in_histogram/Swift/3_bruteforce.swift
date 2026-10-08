func largestRectangleArea(_ heights: [Int]) -> Int {
    var best = 0
    for i in 0..<heights.count {
        var left = i
        while left > 0 && heights[left - 1] >= heights[i] {
            left -= 1
        }
        var right = i
        while right < heights.count - 1 && heights[right + 1] >= heights[i] {
            right += 1
        }
        best = max(best, heights[i] * (right - left + 1))
    }
    return best
}
