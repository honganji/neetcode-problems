class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var result = a
        // The loop only counts |b| steps; each step does the work with bits.
        for _ in 0..<abs(b) {
            result = b > 0 ? increment(result) : decrement(result)
        }
        return result
    }

    // Turn the trailing 1s into 0s until we reach a 0, then set that 0 to 1.
    private func increment(_ x: Int) -> Int {
        var value = x
        var bit = 1
        while (value & bit) != 0 {
            value ^= bit
            bit <<= 1
        }
        return value ^ bit
    }

    // x - 1 == ~(~x + 1), and ~ is just a bit flip.
    private func decrement(_ x: Int) -> Int {
        return ~increment(~x)
    }
}
