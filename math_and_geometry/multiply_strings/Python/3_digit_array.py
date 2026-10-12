def multiply(num1: str, num2: str) -> str:
    if num1 == "0" or num2 == "0":
        return "0"

    m, n = len(num1), len(num2)
    # result[k] collects the products that land at place k, counted from the right.
    result = [0] * (m + n)
    for i in range(m - 1, -1, -1):
        for j in range(n - 1, -1, -1):
            # Digit i of num1 times digit j of num2 lands at places i+j and i+j+1.
            total = int(num1[i]) * int(num2[j]) + result[i + j + 1]
            result[i + j + 1] = total % 10
            result[i + j] += total // 10

    start = 0
    while start < len(result) - 1 and result[start] == 0:
        start += 1
    return "".join(str(d) for d in result[start:])
