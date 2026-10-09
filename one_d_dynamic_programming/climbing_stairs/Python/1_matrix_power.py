class Solution:
    def climbStairs(self, n: int) -> int:
        # [[1, 1], [1, 0]] raised to the n-th power holds Fibonacci numbers.
        def mat_mul(a, b):
            return [
                [a[0][0] * b[0][0] + a[0][1] * b[1][0], a[0][0] * b[0][1] + a[0][1] * b[1][1]],
                [a[1][0] * b[0][0] + a[1][1] * b[1][0], a[1][0] * b[0][1] + a[1][1] * b[1][1]],
            ]

        result = [[1, 0], [0, 1]]  # identity matrix
        base = [[1, 1], [1, 0]]
        while n > 0:
            if n & 1:
                result = mat_mul(result, base)
            base = mat_mul(base, base)  # square: M^1, M^2, M^4, ...
            n >>= 1
        return result[0][0]
