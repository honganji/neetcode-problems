class LRUCache {
    private let capacity: Int
    private var items: [(key: Int, value: Int)] = []

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    private func find(_ key: Int) -> Int? {
        return items.firstIndex { $0.key == key }
    }

    func get(_ key: Int) -> Int {
        guard let i = find(key) else { return -1 }
        let pair = items.remove(at: i)
        items.append(pair)
        return pair.value
    }

    func put(_ key: Int, _ value: Int) {
        if let i = find(key) {
            items.remove(at: i)
        } else if items.count == capacity {
            items.removeFirst()
        }
        items.append((key: key, value: value))
    }
}
