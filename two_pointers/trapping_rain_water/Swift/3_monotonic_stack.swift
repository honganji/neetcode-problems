func trap(_ height: [Int]) -> Int {
    var stack = [Int]()
    var water = 0
    for i in 0..<height.count {
        while let top = stack.last, height[top] < height[i] {
            let bottom = stack.removeLast()
            guard let left = stack.last else { break }
            let width = i - left - 1
            let bounded = min(height[left], height[i]) - height[bottom]
            water += width * bounded
        }
        stack.append(i)
    }
    return water
}
