func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var answer = [Int](repeating: 0, count: temperatures.count)
    var stack = [Int]()
    for (i, temp) in temperatures.enumerated() {
        while let j = stack.last, temperatures[j] < temp {
            stack.removeLast()
            answer[j] = i - j
        }
        stack.append(i)
    }
    return answer
}
