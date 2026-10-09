func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    let dRow = [1, -1, 0, 0]
    let dCol = [0, 0, 1, -1]

    // indegree[r][c] = how many strictly smaller neighbors can step into this cell.
    var indegree = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for r in 0..<rows {
        for c in 0..<cols {
            for k in 0..<4 {
                let nr = r + dRow[k]
                let nc = c + dCol[k]
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] < matrix[r][c] {
                    indegree[r][c] += 1
                }
            }
        }
    }

    // Cells with no smaller neighbor are the starts of paths.
    var queue: [(Int, Int)] = []
    for r in 0..<rows {
        for c in 0..<cols where indegree[r][c] == 0 {
            queue.append((r, c))
        }
    }

    // Use an index instead of removeFirst(), which is slow on arrays.
    var head = 0
    var length = 0
    while head < queue.count {
        // Each pass over the queue is one more step along the longest paths.
        length += 1
        let layerEnd = queue.count
        while head < layerEnd {
            let (r, c) = queue[head]
            head += 1
            for k in 0..<4 {
                let nr = r + dRow[k]
                let nc = c + dCol[k]
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] > matrix[r][c] {
                    indegree[nr][nc] -= 1
                    if indegree[nr][nc] == 0 {
                        queue.append((nr, nc))
                    }
                }
            }
        }
    }
    return length
}
