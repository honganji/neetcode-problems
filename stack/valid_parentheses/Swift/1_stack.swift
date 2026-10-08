func isValid(_ s: String) -> Bool {
    let pairs: [UInt8: UInt8] = [
        UInt8(ascii: ")"): UInt8(ascii: "("),
        UInt8(ascii: "]"): UInt8(ascii: "["),
        UInt8(ascii: "}"): UInt8(ascii: "{"),
    ]
    var stack = [UInt8]()
    for ch in Array(s.utf8) {
        if let opening = pairs[ch] {
            if stack.isEmpty || stack.removeLast() != opening {
                return false
            }
        } else {
            stack.append(ch)
        }
    }
    return stack.isEmpty
}
