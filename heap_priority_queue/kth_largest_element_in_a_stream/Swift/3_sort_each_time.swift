class KthLargest {
    private let k: Int
    private var nums: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        // Re-sort everything on every query and read off the kth largest.
        return nums.sorted(by: >)[k - 1]
    }
}
