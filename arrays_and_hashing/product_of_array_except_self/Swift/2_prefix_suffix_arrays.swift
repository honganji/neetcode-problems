func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var prefix = [Int](repeating: 1, count: n)
    var suffix = [Int](repeating: 1, count: n)
    if n > 1 {
        for i in 1..<n {
            prefix[i] = prefix[i - 1] * nums[i - 1]
        }
    }
    for i in stride(from: n - 2, through: 0, by: -1) {
        suffix[i] = suffix[i + 1] * nums[i + 1]
    }
    var result = [Int](repeating: 1, count: n)
    for i in 0..<n {
        result[i] = prefix[i] * suffix[i]
    }
    return result
}
