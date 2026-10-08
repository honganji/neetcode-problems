func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var counts = [Int: Int]()
    for num in nums {
        counts[num, default: 0] += 1
    }

    var buckets = [[Int]](repeating: [], count: nums.count + 1)
    for (num, freq) in counts {
        buckets[freq].append(num)
    }

    var result = [Int]()
    for freq in stride(from: buckets.count - 1, through: 1, by: -1) {
        for num in buckets[freq] {
            result.append(num)
            if result.count == k {
                return result
            }
        }
    }
    return result
}
