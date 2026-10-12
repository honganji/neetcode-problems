func myPow(_ x: Double, _ n: Int) -> Double {
    var result = 1.0
    // Multiply x by itself |n| times.
    for _ in 0..<n.magnitude {
        result *= x
    }
    return n < 0 ? 1 / result : result
}
