func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    // Sorted ascending, the kth largest is k positions from the end.
    let sorted = nums.sorted()
    return sorted[sorted.count - k]
}
