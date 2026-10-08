func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let indexed = nums.indices.sorted { nums[$0] < nums[$1] }
    var left = 0
    var right = nums.count - 1
    while left < right {
        let total = nums[indexed[left]] + nums[indexed[right]]
        if total == target {
            return [indexed[left], indexed[right]]
        }
        if total < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return []
}
