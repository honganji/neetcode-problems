func multiply(_ num1: String, _ num2: String) -> String {
    let a = num1.utf8.map { Int($0) - 48 }
    let b = num2.utf8.map { Int($0) - 48 }
    if a == [0] || b == [0] { return "0" }

    // result[k] collects the products that land at place k, counted from the left.
    var result = [Int](repeating: 0, count: a.count + b.count)
    for i in (0..<a.count).reversed() {
        for j in (0..<b.count).reversed() {
            // Digit i of num1 times digit j of num2 lands at places i+j and i+j+1.
            let total = a[i] * b[j] + result[i + j + 1]
            result[i + j + 1] = total % 10
            result[i + j] += total / 10
        }
    }

    var start = 0
    while start < result.count - 1 && result[start] == 0 { start += 1 }
    return result[start...].map { String($0) }.joined()
}
