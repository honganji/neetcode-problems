func permute(_ nums: [Int]) -> [[Int]] {
    var perms: [[Int]] = [[]]
    for num in nums {
        var nextPerms: [[Int]] = []
        for perm in perms {
            // Insert num at every possible position of each existing permutation
            for i in 0...perm.count {
                var newPerm = perm
                newPerm.insert(num, at: i)
                nextPerms.append(newPerm)
            }
        }
        perms = nextPerms
    }
    return perms
}
