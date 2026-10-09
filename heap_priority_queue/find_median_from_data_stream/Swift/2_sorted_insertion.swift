class MedianFinder {
    private var nums: [Int] = []  // kept sorted at all times

    func addNum(_ num: Int) {
        // binary search for the spot, then insert (later items shift over)
        var lo = 0
        var hi = nums.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if nums[mid] < num {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        nums.insert(num, at: lo)
    }

    func findMedian() -> Double {
        let n = nums.count
        let mid = n / 2
        if n % 2 == 1 {
            return Double(nums[mid])
        }
        return (Double(nums[mid - 1]) + Double(nums[mid])) / 2
    }
}
