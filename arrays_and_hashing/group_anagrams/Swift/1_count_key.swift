func groupAnagrams(_ strs: [String]) -> [[String]] {
    var groups: [[Int]: [String]] = [:]
    let base = Character("a").asciiValue!
    for s in strs {
        var counts = [Int](repeating: 0, count: 26)
        for byte in s.utf8 {
            counts[Int(byte - base)] += 1
        }
        groups[counts, default: []].append(s)
    }
    return Array(groups.values)
}
