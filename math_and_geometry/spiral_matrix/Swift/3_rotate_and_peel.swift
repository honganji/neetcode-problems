func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result: [Int] = []
    var rows = matrix
    while !rows.isEmpty {
        result += rows.removeFirst()
        if rows.isEmpty { break }
        // Rotate counterclockwise: the last column becomes the new top row.
        let columns = (0..<rows[0].count).map { col in rows.map { $0[col] } }
        rows = columns.reversed()
    }
    return result
}
