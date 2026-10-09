def permute(nums: list[int]) -> list[list[int]]:
    arr = nums[:]
    result = []

    def backtrack(start: int) -> None:
        # Everything before `start` is fixed; try each remaining value at `start`
        if start == len(arr):
            result.append(arr[:])
            return
        for i in range(start, len(arr)):
            arr[start], arr[i] = arr[i], arr[start]  # choose
            backtrack(start + 1)                      # explore
            arr[start], arr[i] = arr[i], arr[start]  # undo

    backtrack(0)
    return result
