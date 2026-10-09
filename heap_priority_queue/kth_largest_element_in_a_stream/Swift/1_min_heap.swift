class KthLargest {
    private let k: Int
    // Min-heap holding only the k largest values seen so far.
    // Its root is the smallest of them, which is the kth largest overall.
    private var heap: [Int] = []

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            offer(num)
        }
    }

    func add(_ val: Int) -> Int {
        offer(val)
        return heap[0]
    }

    private func offer(_ val: Int) {
        if heap.count < k {
            heap.append(val)
            siftUp(heap.count - 1)
        } else if val > heap[0] {
            // Replace the smallest of the top k with the new, larger value.
            heap[0] = val
            siftDown(0)
        }
    }

    private func siftUp(_ index: Int) {
        var i = index
        while i > 0 {
            let parent = (i - 1) / 2
            if heap[parent] <= heap[i] { break }
            heap.swapAt(parent, i)
            i = parent
        }
    }

    private func siftDown(_ index: Int) {
        var i = index
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var smallest = i
            if left < heap.count && heap[left] < heap[smallest] { smallest = left }
            if right < heap.count && heap[right] < heap[smallest] { smallest = right }
            if smallest == i { break }
            heap.swapAt(i, smallest)
            i = smallest
        }
    }
}
