func threeSum(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var result = [[Int]]()
    guard sorted.count >= 3 else { return result }
    for i in 0..<(sorted.count - 2) {
        if i > 0 && sorted[i] == sorted[i - 1] { continue }
        if sorted[i] > 0 { break }
        var seen = Set<Int>()
        var j = i + 1
        while j < sorted.count {
            let complement = -sorted[i] - sorted[j]
            if seen.contains(complement) {
                result.append([sorted[i], complement, sorted[j]])
                while j + 1 < sorted.count && sorted[j] == sorted[j + 1] {
                    j += 1
                }
            }
            seen.insert(sorted[j])
            j += 1
        }
    }
    return result
}
