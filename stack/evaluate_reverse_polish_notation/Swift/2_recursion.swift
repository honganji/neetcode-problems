func evalRPN(_ tokens: [String]) -> Int {
    var index = tokens.count - 1

    func evaluate() -> Int {
        let token = tokens[index]
        index -= 1
        switch token {
        case "+", "-", "*", "/":
            let b = evaluate()
            let a = evaluate()
            switch token {
            case "+": return a + b
            case "-": return a - b
            case "*": return a * b
            default: return a / b
            }
        default:
            return Int(token)!
        }
    }

    return evaluate()
}
