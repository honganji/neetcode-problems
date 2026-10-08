func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var best = 0
    while left < right {
        let shorter = min(height[left], height[right])
        let area = shorter * (right - left)
        if area > best {
            best = area
        }
        while left < right && height[left] <= shorter {
            left += 1
        }
        while left < right && height[right] <= shorter {
            right -= 1
        }
    }
    return best
}
