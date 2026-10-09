func countBits(_ n: Int) -> [Int] {
    var ans: [Int] = []
    for i in 0...n {
        var count = 0
        var x = i
        while x != 0 {
            x &= x - 1  // clear the lowest set bit
            count += 1
        }
        ans.append(count)
    }
    return ans
}
