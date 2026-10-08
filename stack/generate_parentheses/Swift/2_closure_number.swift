func generateParenthesis(_ n: Int) -> [String] {
    var table: [[String]] = [[""]]
    for size in 1...n {
        var combos = [String]()
        for inner in 0..<size {
            for left in table[inner] {
                for right in table[size - 1 - inner] {
                    combos.append("(" + left + ")" + right)
                }
            }
        }
        table.append(combos)
    }
    return table[n]
}
