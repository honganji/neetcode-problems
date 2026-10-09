class TimeMap {
    private var store: [String: [(timestamp: Int, value: String)]] = [:]

    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let entries = store[key], !entries.isEmpty else {
            return ""
        }
        var left = 0
        var right = entries.count - 1
        var result = ""
        while left <= right {
            let mid = (left + right) / 2
            if entries[mid].timestamp <= timestamp {
                result = entries[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}
