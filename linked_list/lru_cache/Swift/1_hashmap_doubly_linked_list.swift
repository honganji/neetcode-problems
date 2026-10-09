class LRUCache {
    private final class Node {
        var key: Int
        var val: Int
        var prev: Node?
        var next: Node?

        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }

    private let capacity: Int
    private var nodes: [Int: Node] = [:]
    private let head = Node(0, 0)
    private let tail = Node(0, 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    private func remove(_ node: Node) {
        let prev = node.prev!
        let next = node.next!
        prev.next = next
        next.prev = prev
    }

    private func addToFront(_ node: Node) {
        node.prev = head
        node.next = head.next
        head.next!.prev = node
        head.next = node
    }

    func get(_ key: Int) -> Int {
        guard let node = nodes[key] else { return -1 }
        remove(node)
        addToFront(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let existing = nodes[key] {
            existing.val = value
            remove(existing)
            addToFront(existing)
            return
        }
        if nodes.count == capacity {
            let lru = tail.prev!
            remove(lru)
            nodes[lru.key] = nil
        }
        let node = Node(key, value)
        nodes[key] = node
        addToFront(node)
    }
}
