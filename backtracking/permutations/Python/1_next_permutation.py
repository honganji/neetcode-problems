def permute(nums: list[int]) -> list[list[int]]:
    arr = sorted(nums)  # start from the smallest arrangement
    result = [arr[:]]

    while True:
        # Find the rightmost i where arr[i] < arr[i + 1]
        i = len(arr) - 2
        while i >= 0 and arr[i] > arr[i + 1]:
            i -= 1
        if i < 0:  # fully descending: this was the last permutation
            return result

        # Find the rightmost j where arr[j] > arr[i]
        j = len(arr) - 1
        while arr[j] < arr[i]:
            j -= 1
        arr[i], arr[j] = arr[j], arr[i]

        # Reverse the suffix so it is in its smallest order
        arr[i + 1:] = arr[i + 1:][::-1]
        result.append(arr[:])
