class TimeMap {
    private var store: [String: [(timestamp: Int, value: String)]] = [:]

    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let entries = store[key] else {
            return ""
        }
        for entry in entries.reversed() {
            if entry.timestamp <= timestamp {
                return entry.value
            }
        }
        return ""
    }
}
