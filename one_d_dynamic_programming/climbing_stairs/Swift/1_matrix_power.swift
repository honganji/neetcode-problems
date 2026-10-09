class Solution {
    func climbStairs(_ n: Int) -> Int {
        // [[1, 1], [1, 0]] raised to the n-th power holds Fibonacci numbers.
        func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
            return [
                [a[0][0] * b[0][0] + a[0][1] * b[1][0], a[0][0] * b[0][1] + a[0][1] * b[1][1]],
                [a[1][0] * b[0][0] + a[1][1] * b[1][0], a[1][0] * b[0][1] + a[1][1] * b[1][1]]
            ]
        }

        var result = [[1, 0], [0, 1]]  // identity matrix
        var base = [[1, 1], [1, 0]]
        var power = n
        while power > 0 {
            if power % 2 == 1 {
                result = multiply(result, base)
            }
            base = multiply(base, base)  // square: M^1, M^2, M^4, ...
            power /= 2
        }
        return result[0][0]
    }
}
