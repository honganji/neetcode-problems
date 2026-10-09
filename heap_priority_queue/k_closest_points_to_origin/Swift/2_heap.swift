func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    // Max-heap of (distance, point): the farthest point sits at index 0.
    var heap: [(dist: Int, point: [Int])] = []

    for p in points {
        let d = p[0] * p[0] + p[1] * p[1]
        if heap.count < k {
            heap.append((dist: d, point: p))
            siftUp(&heap)
        } else if d < heap[0].dist {
            // Closer than the farthest kept point, so it replaces that one.
            heap[0] = (dist: d, point: p)
            siftDown(&heap, 0)
        }
    }
    return heap.map { $0.point }
}

private func siftUp(_ heap: inout [(dist: Int, point: [Int])]) {
    var i = heap.count - 1
    while i > 0 {
        let parent = (i - 1) / 2
        if heap[i].dist <= heap[parent].dist { break }
        heap.swapAt(i, parent)
        i = parent
    }
}

private func siftDown(_ heap: inout [(dist: Int, point: [Int])], _ start: Int) {
    var i = start
    while true {
        let left = 2 * i + 1
        let right = left + 1
        var largest = i
        if left < heap.count && heap[left].dist > heap[largest].dist {
            largest = left
        }
        if right < heap.count && heap[right].dist > heap[largest].dist {
            largest = right
        }
        if largest == i { break }
        heap.swapAt(i, largest)
        i = largest
    }
}
