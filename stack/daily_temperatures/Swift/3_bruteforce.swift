func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    let n = temperatures.count
    var answer = [Int](repeating: 0, count: n)
    for i in 0..<n {
        for j in (i + 1)..<n where temperatures[j] > temperatures[i] {
            answer[i] = j - i
            break
        }
    }
    return answer
}
