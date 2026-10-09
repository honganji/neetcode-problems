// Small binary min-heap of Ints. Swift's standard library has no priority queue.
struct MinHeap {
    private var items: [Int] = []

    var isEmpty: Bool { items.isEmpty }

    mutating func push(_ value: Int) {
        items.append(value)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if items[parent] <= items[i] { break }
            items.swapAt(parent, i)
            i = parent
        }
    }

    mutating func pop() -> Int? {
        guard let top = items.first else { return nil }
        let last = items.removeLast()
        if !items.isEmpty {
            items[0] = last
            var i = 0
            while true {
                let left = 2 * i + 1
                let right = left + 1
                var smallest = i
                if left < items.count && items[left] < items[smallest] {
                    smallest = left
                }
                if right < items.count && items[right] < items[smallest] {
                    smallest = right
                }
                if smallest == i { break }
                items.swapAt(i, smallest)
                i = smallest
            }
        }
        return top
    }
}

func swimInWater(_ grid: [[Int]]) -> Int {
    let n = grid.count
    let total = n * n
    // Lowest time needed to reach each cell so far. total is above every height.
    var best = [Int](repeating: total, count: total)
    best[0] = grid[0][0]
    // Heap entries encode (time, cell) as time * total + cell, so one Int is enough.
    var heap = MinHeap()
    heap.push(grid[0][0] * total)
    let dr = [1, -1, 0, 0]
    let dc = [0, 0, 1, -1]

    while let top = heap.pop() {
        let t = top / total
        let cell = top % total
        if t > best[cell] { continue }  // stale entry, a better one was already processed
        if cell == total - 1 { return t }

        let r = cell / n
        let c = cell % n
        for k in 0..<4 {
            let nr = r + dr[k]
            let nc = c + dc[k]
            if nr >= 0 && nr < n && nc >= 0 && nc < n {
                let next = nr * n + nc
                // Reaching the neighbor takes as long as the larger of our time and its height.
                let nt = max(t, grid[nr][nc])
                if nt < best[next] {
                    best[next] = nt
                    heap.push(nt * total + next)
                }
            }
        }
    }
    return -1
}
