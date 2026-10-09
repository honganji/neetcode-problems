class Solution {
    func reverseBits(_ n: Int) -> Int {
        // Take bits off n from the lowest end and push each one onto the
        // bottom of the result. The first bit read ends up at the top.
        var bits = n
        var result = 0
        for _ in 0..<32 {
            result = (result << 1) | (bits & 1)
            bits >>= 1
        }
        return result
    }
}
