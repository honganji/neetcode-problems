func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var merged = [Int]()
    merged.reserveCapacity(nums1.count + nums2.count)
    var i = 0
    var j = 0
    while i < nums1.count && j < nums2.count {
        if nums1[i] <= nums2[j] {
            merged.append(nums1[i])
            i += 1
        } else {
            merged.append(nums2[j])
            j += 1
        }
    }
    merged.append(contentsOf: nums1[i...])
    merged.append(contentsOf: nums2[j...])
    let total = merged.count
    let mid = total / 2
    if total % 2 == 1 {
        return Double(merged[mid])
    }
    return Double(merged[mid - 1] + merged[mid]) / 2.0
}
