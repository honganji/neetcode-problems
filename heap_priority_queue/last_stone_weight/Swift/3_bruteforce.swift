func lastStoneWeight(_ stones: [Int]) -> Int {
    var rest = stones  // copy, so the caller's array is untouched

    while rest.count > 1 {
        let heaviest = rest.max()!
        let heaviestIndex = rest.firstIndex(of: heaviest)!
        rest.remove(at: heaviestIndex)
        let second = rest.max()!
        let secondIndex = rest.firstIndex(of: second)!
        rest.remove(at: secondIndex)
        if heaviest != second {
            rest.append(heaviest - second)
        }
    }

    return rest.first ?? 0
}
