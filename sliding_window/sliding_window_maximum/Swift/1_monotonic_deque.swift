func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var window = [Int]()
    var head = 0
    for i in 0..<nums.count {
        while window.count > head && nums[window[window.count - 1]] <= nums[i] {
            window.removeLast()
        }
        window.append(i)
        if window[head] <= i - k {
            head += 1
        }
        if i >= k - 1 {
            result.append(nums[window[head]])
        }
    }
    return result
}
