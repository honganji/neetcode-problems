func checkValidString(_ s: String) -> Bool {
    var openPositions: [Int] = []  // indices of "(" that are not matched yet
    var starPositions: [Int] = []  // indices of "*"
    for (i, c) in s.enumerated() {
        switch c {
        case "(":
            openPositions.append(i)
        case "*":
            starPositions.append(i)
        default:
            // Match ")" with a real "(" first, and save "*" for later.
            if !openPositions.isEmpty {
                openPositions.removeLast()
            } else if !starPositions.isEmpty {
                starPositions.removeLast()
            } else {
                return false
            }
        }
    }
    // Each leftover "(" needs a "*" after it to close it.
    while !openPositions.isEmpty && !starPositions.isEmpty {
        if openPositions.removeLast() > starPositions.removeLast() { return false }
    }
    return openPositions.isEmpty
}
