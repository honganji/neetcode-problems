func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var counts = [Int: Int]()
    for num in nums {
        counts[num, default: 0] += 1
    }

    // Min-heap of (freq, num) pairs, ordered by freq.
    var heap = [(freq: Int, num: Int)]()

    func siftUp(_ start: Int) {
        var i = start
        while i > 0 {
            let parent = (i - 1) / 2
            if heap[parent].freq <= heap[i].freq { break }
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
            if left < heap.count && heap[left].freq < heap[smallest].freq {
                smallest = left
            }
            if right < heap.count && heap[right].freq < heap[smallest].freq {
                smallest = right
            }
            if smallest == i { break }
            heap.swapAt(smallest, i)
            i = smallest
        }
    }

    for (num, freq) in counts {
        heap.append((freq: freq, num: num))
        siftUp(heap.count - 1)
        if heap.count > k {
            heap[0] = heap.removeLast()
            siftDown(0)
        }
    }

    return heap.map { $0.num }
}
