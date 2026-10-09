func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var a = nums1
    var b = nums2
    if a.count > b.count {
        a = nums2
        b = nums1
    }
    let m = a.count
    let n = b.count
    let half = (m + n + 1) / 2
    var low = 0
    var high = m
    while low <= high {
        let i = (low + high) / 2
        let j = half - i
        let maxLeftA = i > 0 ? a[i - 1] : Int.min
        let minRightA = i < m ? a[i] : Int.max
        let maxLeftB = j > 0 ? b[j - 1] : Int.min
        let minRightB = j < n ? b[j] : Int.max
        if maxLeftA <= minRightB && maxLeftB <= minRightA {
            let maxLeft = max(maxLeftA, maxLeftB)
            if (m + n) % 2 == 1 {
                return Double(maxLeft)
            }
            let minRight = min(minRightA, minRightB)
            return Double(maxLeft + minRight) / 2.0
        }
        if maxLeftA > minRightB {
            high = i - 1
        } else {
            low = i + 1
        }
    }
    return 0.0
}
