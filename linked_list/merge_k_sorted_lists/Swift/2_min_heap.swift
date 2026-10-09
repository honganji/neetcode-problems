// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    // Min-heap of nodes, ordered by val.
    var heap = [ListNode]()

    func siftUp(_ start: Int) {
        var i = start
        while i > 0 {
            let parent = (i - 1) / 2
            if heap[parent].val <= heap[i].val { break }
            heap.swapAt(parent, i)
            i = parent
        }
    }

    func siftDown(_ start: Int) {
        var i = start
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var smallest = i
            if left < heap.count && heap[left].val < heap[smallest].val {
                smallest = left
            }
            if right < heap.count && heap[right].val < heap[smallest].val {
                smallest = right
            }
            if smallest == i { break }
            heap.swapAt(smallest, i)
            i = smallest
        }
    }

    func push(_ node: ListNode) {
        heap.append(node)
        siftUp(heap.count - 1)
    }

    func pop() -> ListNode {
        let top = heap[0]
        let last = heap.removeLast()
        if !heap.isEmpty {
            heap[0] = last
            siftDown(0)
        }
        return top
    }

    for head in lists {
        if let node = head { push(node) }
    }

    let dummy = ListNode()
    var tail = dummy
    while !heap.isEmpty {
        let node = pop()
        tail.next = node
        tail = node
        if let next = node.next { push(next) }
    }
    return dummy.next
}
