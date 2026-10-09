class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)

        func match(_ i: Int, _ j: Int) -> Bool {
            if j == pChars.count { return i == sChars.count }
            let firstMatch = i < sChars.count && (pChars[j] == sChars[i] || pChars[j] == ".")
            if j + 1 < pChars.count && pChars[j + 1] == "*" {
                // try zero matches first, then one match staying on "x*"
                return match(i, j + 2) || (firstMatch && match(i + 1, j))
            }
            return firstMatch && match(i + 1, j + 1)
        }

        return match(0, 0)
    }
}
