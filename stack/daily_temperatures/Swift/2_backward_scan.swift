func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    let n = temperatures.count
    var answer = [Int](repeating: 0, count: n)
    if n < 2 {
        return answer
    }
    for i in stride(from: n - 2, through: 0, by: -1) {
        var j = i + 1
        while temperatures[j] <= temperatures[i] {
            if answer[j] == 0 {
                j = -1
                break
            }
            j += answer[j]
        }
        if j != -1 {
            answer[i] = j - i
        }
    }
    return answer
}
