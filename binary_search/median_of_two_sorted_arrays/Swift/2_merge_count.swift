func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let total = nums1.count + nums2.count
    var i = 0
    var j = 0
    var prev = 0
    var curr = 0
    for _ in 0..<(total / 2 + 1) {
        prev = curr
        if j >= nums2.count || (i < nums1.count && nums1[i] <= nums2[j]) {
            curr = nums1[i]
            i += 1
        } else {
            curr = nums2[j]
            j += 1
        }
    }
    if total % 2 == 1 {
        return Double(curr)
    }
    return Double(prev + curr) / 2.0
}
