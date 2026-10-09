class MedianFinder {
    private var nums: [Int] = []

    func addNum(_ num: Int) {
        nums.append(num)
    }

    func findMedian() -> Double {
        let sorted = nums.sorted()
        let n = sorted.count
        let mid = n / 2
        if n % 2 == 1 {
            return Double(sorted[mid])
        }
        return (Double(sorted[mid - 1]) + Double(sorted[mid])) / 2
    }
}
