func threeSum(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var result = [[Int]]()
    guard sorted.count >= 3 else { return result }
    for i in 0..<(sorted.count - 2) {
        if i > 0 && sorted[i] == sorted[i - 1] { continue }
        if sorted[i] > 0 { break }
        var left = i + 1
        var right = sorted.count - 1
        while left < right {
            let total = sorted[i] + sorted[left] + sorted[right]
            if total < 0 {
                left += 1
            } else if total > 0 {
                right -= 1
            } else {
                result.append([sorted[i], sorted[left], sorted[right]])
                left += 1
                right -= 1
                while left < right && sorted[left] == sorted[left - 1] {
                    left += 1
                }
                while left < right && sorted[right] == sorted[right + 1] {
                    right -= 1
                }
            }
        }
    }
    return result
}
