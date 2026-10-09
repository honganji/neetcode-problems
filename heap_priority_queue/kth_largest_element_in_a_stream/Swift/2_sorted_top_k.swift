class KthLargest {
    private let k: Int
    // Sorted ascending, holding only the k largest values seen so far.
    private var top: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.top = Array(nums.sorted().suffix(k))
    }

    func add(_ val: Int) -> Int {
        if top.count < k {
            insertSorted(val)
        } else if val > top[0] {
            // Drop the smallest of the top k, then slot the new value in order.
            top.removeFirst()
            insertSorted(val)
        }
        return top[0]
    }

    // Binary search for the first position holding a value >= val, then insert there.
    private func insertSorted(_ val: Int) {
        var low = 0
        var high = top.count
        while low < high {
            let mid = (low + high) / 2
            if top[mid] < val {
                low = mid + 1
            } else {
                high = mid
            }
        }
        top.insert(val, at: low)
    }
}
