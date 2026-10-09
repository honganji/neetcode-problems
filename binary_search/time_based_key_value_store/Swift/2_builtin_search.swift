class TimeMap {
    private var timestamps: [String: [Int]] = [:]
    private var values: [String: [String]] = [:]

    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        timestamps[key, default: []].append(timestamp)
        values[key, default: []].append(value)
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let stamps = timestamps[key], !stamps.isEmpty else {
            return ""
        }
        let index = upperBound(stamps, timestamp)
        if index == 0 {
            return ""
        }
        return values[key]![index - 1]
    }

    private func upperBound(_ sorted: [Int], _ target: Int) -> Int {
        var low = 0
        var high = sorted.count
        while low < high {
            let mid = (low + high) / 2
            if sorted[mid] <= target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}
