func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = [Int](repeating: 1, count: n)
    for i in 0..<n {
        var product = 1
        for j in 0..<n where j != i {
            product *= nums[j]
        }
        result[i] = product
    }
    return result
}
