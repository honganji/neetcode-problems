func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    var current = [Character]()

    func backtrack(_ openCount: Int, _ closeCount: Int) {
        if current.count == 2 * n {
            result.append(String(current))
            return
        }
        if openCount < n {
            current.append("(")
            backtrack(openCount + 1, closeCount)
            current.removeLast()
        }
        if closeCount < openCount {
            current.append(")")
            backtrack(openCount, closeCount + 1)
            current.removeLast()
        }
    }

    backtrack(0, 0)
    return result
}
