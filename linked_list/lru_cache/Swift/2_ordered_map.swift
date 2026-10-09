class LRUCache {
    private let capacity: Int
    private var values: [Int: Int] = [:]
    private var order: [Int] = []

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    private func moveToEnd(_ key: Int) {
        if let i = order.firstIndex(of: key) {
            order.remove(at: i)
        }
        order.append(key)
    }

    func get(_ key: Int) -> Int {
        guard let value = values[key] else { return -1 }
        moveToEnd(key)
        return value
    }

    func put(_ key: Int, _ value: Int) {
        if values[key] == nil && values.count == capacity {
            let oldest = order.removeFirst()
            values[oldest] = nil
        }
        values[key] = value
        moveToEnd(key)
    }
}
