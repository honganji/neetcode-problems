func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = [Int](repeating: 1, count: n)
    if n > 1 {
        for i in 1..<n {
            result[i] = result[i - 1] * nums[i - 1]
        }
    }
    var suffix = 1
    for i in stride(from: n - 1, through: 0, by: -1) {
        result[i] *= suffix
        suffix *= nums[i]
    }
    return result
}
