func threeSum(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var triplets = Set<[Int]>()
    guard sorted.count >= 3 else { return [] }
    for i in 0..<(sorted.count - 2) {
        for j in (i + 1)..<(sorted.count - 1) {
            for k in (j + 1)..<sorted.count {
                if sorted[i] + sorted[j] + sorted[k] == 0 {
                    triplets.insert([sorted[i], sorted[j], sorted[k]])
                }
            }
        }
    }
    return Array(triplets)
}
