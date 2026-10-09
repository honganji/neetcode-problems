func permute(_ nums: [Int]) -> [[Int]] {
    var arr = nums.sorted()  // start from the smallest arrangement
    var result = [arr]

    while true {
        // Find the rightmost i where arr[i] < arr[i + 1]
        var i = arr.count - 2
        while i >= 0 && arr[i] > arr[i + 1] {
            i -= 1
        }
        if i < 0 { return result }  // fully descending: this was the last permutation

        // Find the rightmost j where arr[j] > arr[i]
        var j = arr.count - 1
        while arr[j] < arr[i] {
            j -= 1
        }
        arr.swapAt(i, j)

        // Reverse the suffix so it is in its smallest order
        arr[(i + 1)...].reverse()
        result.append(arr)
    }
}
