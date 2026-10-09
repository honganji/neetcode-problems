fun checkValidString(s: String): Boolean {
    val n = s.length
    // valid[i][j] is true if s.substring(i, j) can be made into a valid string.
    val valid = Array(n + 1) { BooleanArray(n + 1) }
    for (i in 0..n) valid[i][i] = true // the empty string is valid

    for (length in 1..n) {
        for (i in 0..n - length) {
            val j = i + length
            if (s[i] == '*' && valid[i + 1][j]) {
                // This '*' is an empty string.
                valid[i][j] = true
            } else if (s[i] != ')') {
                // s[i] opens a pair that is closed by some s[k].
                for (k in i + 1 until j) {
                    if (s[k] != '(' && valid[i + 1][k] && valid[k + 1][j]) {
                        valid[i][j] = true
                        break
                    }
                }
            }
        }
    }
    return valid[0][n]
}
