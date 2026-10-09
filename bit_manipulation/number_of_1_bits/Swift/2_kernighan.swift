class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var x = n
        var count = 0
        // x & (x - 1) clears the lowest set bit, so this loops once per 1 bit.
        while x != 0 {
            x &= x - 1
            count += 1
        }
        return count
    }
}
