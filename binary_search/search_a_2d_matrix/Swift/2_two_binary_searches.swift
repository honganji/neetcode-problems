func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var top = 0
    var bottom = matrix.count - 1
    while top <= bottom {
        let mid = (top + bottom) / 2
        if target < matrix[mid][0] {
            bottom = mid - 1
        } else if target > matrix[mid][matrix[mid].count - 1] {
            top = mid + 1
        } else {
            break
        }
    }
    if top > bottom {
        return false
    }
    let row = matrix[(top + bottom) / 2]
    var left = 0
    var right = row.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if row[mid] == target {
            return true
        }
        if row[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}
