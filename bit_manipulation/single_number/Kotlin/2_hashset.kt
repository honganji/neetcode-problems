class Solution {
    fun singleNumber(nums: IntArray): Int {
        val seen = HashSet<Int>()
        for (n in nums) {
            if (!seen.remove(n)) {
                seen.add(n) // first copy: remember it
            }
        }
        return seen.first() // only the unpaired number is left
    }
}
