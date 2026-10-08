func isValid(_ s: String) -> Bool {
    let chars = Array(s.utf8)
    let pairs: [UInt8: UInt8] = [
        UInt8(ascii: "("): UInt8(ascii: ")"),
        UInt8(ascii: "["): UInt8(ascii: "]"),
        UInt8(ascii: "{"): UInt8(ascii: "}"),
    ]

    func parse(_ start: Int) -> Int {
        guard start < chars.count, let closing = pairs[chars[start]] else {
            return -1
        }
        var i = start + 1
        while i < chars.count && chars[i] != closing {
            i = parse(i)
            if i == -1 {
                return -1
            }
        }
        return i < chars.count ? i + 1 : -1
    }

    var i = 0
    while i < chars.count {
        i = parse(i)
        if i == -1 {
            return false
        }
    }
    return true
}
