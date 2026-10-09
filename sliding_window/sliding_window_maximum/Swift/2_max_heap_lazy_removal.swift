func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    // Max-heap of (value, index) pairs, ordered by value.
    var heap = [(value: Int, index: Int)]()

    func siftUp(_ start: Int) {
        var i = start
        while i > 0 {
            let parent = (i - 1) / 2
            if heap[parent].value >= heap[i].value { break }
            heap.swapAt(parent, i)
            i = parent
        }
    }

    func siftDown(_ start: Int) {
        var i = start
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var largest = i
            if left < heap.count && heap[left].value > heap[largest].value {
                largest = left
            }
            if right < heap.count && heap[right].value > heap[largest].value {
                largest = right
            }
            if largest == i { break }
            heap.swapAt(largest, i)
            i = largest
        }
    }

    var result = [Int]()
    for i in 0..<nums.count {
        heap.append((value: nums[i], index: i))
        siftUp(heap.count - 1)
        if i >= k - 1 {
            while heap[0].index <= i - k {
                heap[0] = heap.removeLast()
                siftDown(0)
            }
            result.append(heap[0].value)
        }
    }
    return result
}
