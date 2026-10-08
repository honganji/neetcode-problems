func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var counts = [Int: Int]()
    for num in nums {
        counts[num, default: 0] += 1
    }

    let ordered = counts.sorted { $0.value > $1.value }
    return ordered.prefix(k).map { $0.key }
}
