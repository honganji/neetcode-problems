fun permute(nums: IntArray): List<List<Int>> {
    var perms: List<List<Int>> = listOf(emptyList())
    for (num in nums) {
        val nextPerms = mutableListOf<List<Int>>()
        for (perm in perms) {
            // Insert num at every possible position of each existing permutation
            for (i in 0..perm.size) {
                nextPerms.add(perm.subList(0, i) + num + perm.subList(i, perm.size))
            }
        }
        perms = nextPerms
    }
    return perms
}
