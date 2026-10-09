// Swift's standard library has no heap, so a small min-heap is included here.
struct MinHeap {
    private var items: [Int] = []

    var count: Int { items.count }
    var top: Int { items[0] }

    mutating func push(_ x: Int) {
        items.append(x)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent] <= items[i] { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    mutating func pop() -> Int {
        items.swapAt(0, items.count - 1)
        let result = items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var smallest = i
            if left < items.count && items[left] < items[smallest] { smallest = left }
            if right < items.count && items[right] < items[smallest] { smallest = right }
            if smallest == i { break }
            items.swapAt(i, smallest)
            i = smallest
        }
        return result
    }
}

class MedianFinder {
    // max-heap for the smaller half, stored as negatives so MinHeap can be used
    private var low = MinHeap()
    // min-heap for the larger half
    private var high = MinHeap()

    func addNum(_ num: Int) {
        // push into low, then move low's largest into high
        low.push(-num)
        high.push(-low.pop())
        // keep low the same size as high, or one bigger
        if high.count > low.count {
            low.push(-high.pop())
        }
    }

    func findMedian() -> Double {
        if low.count > high.count {
            return Double(-low.top)
        }
        return (Double(-low.top) + Double(high.top)) / 2
    }
}
