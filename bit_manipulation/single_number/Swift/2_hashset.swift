class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var seen = Set<Int>()
        for n in nums {
            if seen.contains(n) {
                seen.remove(n)  // second copy found: the pair is complete
            } else {
                seen.insert(n)  // first copy: remember it
            }
        }
        return seen.first!  // only the unpaired number is left
    }
}
