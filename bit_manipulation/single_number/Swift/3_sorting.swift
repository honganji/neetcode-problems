class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()  // sorted copy, equal numbers become neighbors
        var i = 0
        while i < sorted.count - 1 {
            if sorted[i] != sorted[i + 1] {
                return sorted[i]
            }
            i += 2  // skip the matching pair
        }
        return sorted[sorted.count - 1]  // the single number is at the end
    }
}
