class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)
        if total % 2 != 0 { return false }
        let target = total / 2

        // Bit s is 1 when some subset adds up to sum s, packed 64 per word.
        // Only sums up to target are needed, so the array stops there.
        var words = [UInt64](repeating: 0, count: target / 64 + 1)
        words[0] = 1

        for num in nums {
            // Shifting left by num adds num to every reachable sum at once.
            let wordShift = num / 64
            let bitShift = num % 64
            // Go from high words to low so we read values not yet updated.
            for i in stride(from: words.count - 1, through: wordShift, by: -1) {
                var shifted = words[i - wordShift] << bitShift
                if bitShift > 0 && i - wordShift > 0 {
                    shifted |= words[i - wordShift - 1] >> (64 - bitShift)
                }
                words[i] |= shifted
            }
        }

        return ((words[target / 64] >> (target % 64)) & 1) == 1
    }
}
