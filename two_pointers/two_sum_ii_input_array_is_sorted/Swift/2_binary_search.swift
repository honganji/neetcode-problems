func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    for i in 0..<numbers.count {
        let complement = target - numbers[i]
        var low = i + 1
        var high = numbers.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if numbers[mid] == complement {
                return [i + 1, mid + 1]
            }
            if numbers[mid] < complement {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    return []
}
