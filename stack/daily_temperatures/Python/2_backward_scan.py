def daily_temperatures(temperatures: list[int]) -> list[int]:
    n = len(temperatures)
    answer = [0] * n
    for i in range(n - 2, -1, -1):
        j = i + 1
        while temperatures[j] <= temperatures[i]:
            if answer[j] == 0:
                j = -1
                break
            j += answer[j]
        if j != -1:
            answer[i] = j - i
    return answer
