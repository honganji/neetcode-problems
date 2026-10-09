class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        // Check each of the 32 bit positions.
        for i in 0..<32 {
            count += ((n >> i) & 1)
        }
        return count
    }
}
