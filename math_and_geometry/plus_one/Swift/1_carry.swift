func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    // Walk from the least significant digit and stop at the first digit that can absorb the carry.
    for i in digits.indices.reversed() {
        if digits[i] < 9 {
            digits[i] += 1
            return digits
        }
        // A 9 becomes 0 and passes the carry to the digit on its left.
        digits[i] = 0
    }
    // Every digit was 9, so the result gains a leading 1.
    return [1] + digits
}
