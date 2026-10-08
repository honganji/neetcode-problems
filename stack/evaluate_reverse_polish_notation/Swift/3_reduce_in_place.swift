func evalRPN(_ tokens: [String]) -> Int {
    let operators: Set<String> = ["+", "-", "*", "/"]
    var list = tokens
    while list.count > 1 {
        var i = 0
        while !operators.contains(list[i]) {
            i += 1
        }
        let a = Int(list[i - 2])!
        let b = Int(list[i - 1])!
        let result: Int
        switch list[i] {
        case "+": result = a + b
        case "-": result = a - b
        case "*": result = a * b
        default: result = a / b
        }
        list.replaceSubrange((i - 2)...i, with: [String(result)])
    }
    return Int(list[0])!
}
