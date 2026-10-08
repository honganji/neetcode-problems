func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    for token in tokens {
        switch token {
        case "+", "-", "*", "/":
            let b = stack.removeLast()
            let a = stack.removeLast()
            switch token {
            case "+": stack.append(a + b)
            case "-": stack.append(a - b)
            case "*": stack.append(a * b)
            default: stack.append(a / b)
            }
        default:
            stack.append(Int(token)!)
        }
    }
    return stack[stack.count - 1]
}
