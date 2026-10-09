def permute(nums: list[int]) -> list[list[int]]:
    perms = [[]]
    for num in nums:
        next_perms = []
        for perm in perms:
            # Insert num at every possible position of each existing permutation
            for i in range(len(perm) + 1):
                next_perms.append(perm[:i] + [num] + perm[i:])
        perms = next_perms
    return perms
