class Solution {
    fun hammingWeight(n: Int): Int {
        var x = n
        var count = 0
        // x and (x - 1) clears the lowest set bit, so this loops once per 1 bit.
        while (x != 0) {
            x = x and (x - 1)
            count++
        }
        return count
    }
}
