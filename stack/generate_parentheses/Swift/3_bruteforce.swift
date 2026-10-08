func generateParenthesis(_ n: Int) -> [String] {
    func isValid(_ chars: [UInt8]) -> Bool {
        var balance = 0
        for ch in chars {
            balance += ch == UInt8(ascii: "(") ? 1 : -1
            if balance < 0 {
                return false
            }
        }
        return balance == 0
    }

    var result = [String]()
    let total = 2 * n
    for mask in 0..<(1 << total) {
        var chars = [UInt8]()
        for i in 0..<total {
            chars.append((mask >> i) & 1 == 1 ? UInt8(ascii: "(") : UInt8(ascii: ")"))
        }
        if isValid(chars) {
            result.append(String(decoding: chars, as: UTF8.self))
        }
    }
    return result
}
