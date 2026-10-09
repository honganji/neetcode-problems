class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        // XOR adds bits without carrying; AND shifted left is the carry.
        // Repeat until no carry is left. `<<` does not trap on overflow.
        while y != 0 {
            let carry = (x & y) << 1
            x = x ^ y
            y = carry
        }
        return x
    }
}
