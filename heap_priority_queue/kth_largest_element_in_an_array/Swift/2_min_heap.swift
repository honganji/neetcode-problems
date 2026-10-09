func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    // Min-heap (stored in an array) that keeps only the k largest values seen so far.
    // Its smallest item at index 0 is the kth largest overall.
    var heap: [Int] = []
    for num in nums {
        heap.append(num)
        siftUp(&heap, heap.count - 1)
        if heap.count > k {
            // Remove the smallest (root): move the last item to the root and sift it down.
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            siftDown(&heap, 0)
        }
    }
    return heap[0]
}

private func siftUp(_ heap: inout [Int], _ index: Int) {
    var i = index
    while i > 0 {
        let parent = (i - 1) / 2
        if heap[parent] <= heap[i] { break }
        heap.swapAt(parent, i)
        i = parent
    }
}

private func siftDown(_ heap: inout [Int], _ index: Int) {
    var i = index
    while true {
        let left = 2 * i + 1
        let right = left + 1
        var smallest = i
        if left < heap.count && heap[left] < heap[smallest] {
            smallest = left
        }
        if right < heap.count && heap[right] < heap[smallest] {
            smallest = right
        }
        if smallest == i { break }
        heap.swapAt(i, smallest)
        i = smallest
    }
}
