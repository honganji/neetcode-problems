func lastStoneWeight(_ stones: [Int]) -> Int {
    var heap = MaxHeap(stones)

    while heap.count > 1 {
        let heaviest = heap.pop()
        let second = heap.pop()
        if heaviest != second {
            heap.push(heaviest - second)
        }
    }

    return heap.isEmpty ? 0 : heap.pop()
}

// Swift has no built-in priority queue, so here is a small binary max-heap.
struct MaxHeap {
    private var items: [Int] = []

    init(_ values: [Int]) {
        for value in values {
            push(value)
        }
    }

    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }

    mutating func push(_ value: Int) {
        items.append(value)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent] >= items[i] { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    // Removes and returns the largest value. Call only when count > 0.
    mutating func pop() -> Int {
        let top = items[0]
        let last = items.removeLast()
        if !items.isEmpty {
            items[0] = last
            var i = 0
            while true {
                let left = 2 * i + 1
                let right = left + 1
                var largest = i
                if left < items.count && items[left] > items[largest] { largest = left }
                if right < items.count && items[right] > items[largest] { largest = right }
                if largest == i { break }
                items.swapAt(i, largest)
                i = largest
            }
        }
        return top
    }
}
