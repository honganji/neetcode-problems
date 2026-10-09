func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
    // Sweep the queries from smallest to largest. Intervals join a heap once their
    // left end is reached; the heap is ordered by size.
    let byLeft = intervals.sorted { $0[0] < $1[0] }
    let order = queries.indices.sorted { queries[$0] < queries[$1] }
    var answer = [Int](repeating: -1, count: queries.count)
    var heap = MinHeap()  // entries are (size, right)
    var next = 0

    for qi in order {
        let q = queries[qi]
        while next < byLeft.count && byLeft[next][0] <= q {
            let left = byLeft[next][0]
            let right = byLeft[next][1]
            heap.push((size: right - left + 1, right: right))
            next += 1
        }
        // Queries only grow, so intervals that ended before q can never help again.
        while let top = heap.peek(), top.right < q {
            heap.pop()
        }
        if let top = heap.peek() {
            answer[qi] = top.size
        }
    }
    return answer
}

// A small binary min-heap ordered by size (Swift has no built-in heap).
struct MinHeap {
    private var items: [(size: Int, right: Int)] = []

    func peek() -> (size: Int, right: Int)? {
        return items.first
    }

    mutating func push(_ item: (size: Int, right: Int)) {
        items.append(item)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent].size <= items[i].size { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    mutating func pop() {
        guard !items.isEmpty else { return }
        items.swapAt(0, items.count - 1)
        items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = 2 * i + 2
            var smallest = i
            if left < items.count && items[left].size < items[smallest].size {
                smallest = left
            }
            if right < items.count && items[right].size < items[smallest].size {
                smallest = right
            }
            if smallest == i { break }
            items.swapAt(i, smallest)
            i = smallest
        }
    }
}
