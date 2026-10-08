func groupAnagrams(_ strs: [String]) -> [[String]] {
    let base = Character("a").asciiValue!

    func letterCounts(_ s: String) -> [Int] {
        var counts = [Int](repeating: 0, count: 26)
        for byte in s.utf8 {
            counts[Int(byte - base)] += 1
        }
        return counts
    }

    let counts = strs.map(letterCounts)
    var visited = [Bool](repeating: false, count: strs.count)
    var result: [[String]] = []
    for i in 0..<strs.count {
        if visited[i] { continue }
        var group = [strs[i]]
        visited[i] = true
        for j in (i + 1)..<strs.count {
            if !visited[j] && counts[i] == counts[j] {
                group.append(strs[j])
                visited[j] = true
            }
        }
        result.append(group)
    }
    return result
}
