func trap(_ height: [Int]) -> Int {
    let n = height.count
    if n == 0 {
        return 0
    }
    var leftMax = [Int](repeating: 0, count: n)
    var rightMax = [Int](repeating: 0, count: n)
    leftMax[0] = height[0]
    for i in 1..<n {
        leftMax[i] = max(leftMax[i - 1], height[i])
    }
    rightMax[n - 1] = height[n - 1]
    for i in stride(from: n - 2, through: 0, by: -1) {
        rightMax[i] = max(rightMax[i + 1], height[i])
    }
    var water = 0
    for i in 0..<n {
        water += min(leftMax[i], rightMax[i]) - height[i]
    }
    return water
}
