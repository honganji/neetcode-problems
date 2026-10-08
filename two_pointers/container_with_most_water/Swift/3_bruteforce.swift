func maxArea(_ height: [Int]) -> Int {
    var best = 0
    for i in 0..<height.count {
        for j in (i + 1)..<height.count {
            let area = min(height[i], height[j]) * (j - i)
            if area > best {
                best = area
            }
        }
    }
    return best
}
