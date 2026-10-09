func checkValidString(_ s: String) -> Bool {
    let chars = Array(s)
    let n = chars.count
    // valid[i][j] is true if chars[i..<j] can be made into a valid string.
    var valid = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    for i in 0...n {
        valid[i][i] = true  // the empty string is valid
    }

    for length in 1..<(n + 1) {
        for i in 0..<(n - length + 1) {
            let j = i + length
            if chars[i] == "*" && valid[i + 1][j] {
                // This "*" is an empty string.
                valid[i][j] = true
            } else if chars[i] != ")" {
                // chars[i] opens a pair that is closed by some chars[k].
                for k in (i + 1)..<j {
                    if chars[k] != "(" && valid[i + 1][k] && valid[k + 1][j] {
                        valid[i][j] = true
                        break
                    }
                }
            }
        }
    }
    return valid[0][n]
}
