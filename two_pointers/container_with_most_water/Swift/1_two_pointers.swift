func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var best = 0
    while left < right {
        let area = min(height[left], height[right]) * (right - left)
        if area > best {
            best = area
        }
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return best
}
