func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let sorted = intervals.sorted { $0[0] < $1[0] }

    // Min-heap of end times for the rooms in use; the earliest end is always on top.
    var ends = MinHeap()
    for meeting in sorted {
        if let earliest = ends.peek, earliest <= meeting[0] {
            // The room that frees up first is free now, so reuse it.
            ends.pop()
        }
        ends.push(meeting[1])
    }
    return ends.count
}

// Swift's standard library has no priority queue, so here is a small binary min-heap.
struct MinHeap {
    private var data: [Int] = []

    var count: Int { data.count }
    var peek: Int? { data.first }

    mutating func push(_ value: Int) {
        data.append(value)
        var i = data.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if data[parent] <= data[i] { break }
            data.swapAt(i, parent)
            i = parent
        }
    }

    @discardableResult
    mutating func pop() -> Int? {
        guard let top = data.first else { return nil }
        let last = data.removeLast()
        if !data.isEmpty {
            data[0] = last
            var i = 0
            while true {
                let left = 2 * i + 1
                let right = left + 1
                var smallest = i
                if left < data.count && data[left] < data[smallest] { smallest = left }
                if right < data.count && data[right] < data[smallest] { smallest = right }
                if smallest == i { break }
                data.swapAt(i, smallest)
                i = smallest
            }
        }
        return top
    }
}
