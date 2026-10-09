private let keypad: [Character: [Character]] = [
    "2": Array("abc"), "3": Array("def"), "4": Array("ghi"), "5": Array("jkl"),
    "6": Array("mno"), "7": Array("pqrs"), "8": Array("tuv"), "9": Array("wxyz"),
]

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }

    let options = digits.map { keypad[$0]! }
    var total = 1
    for letters in options {
        total *= letters.count
    }

    var result: [String] = []
    result.reserveCapacity(total)
    for k in 0..<total {
        // Decode k like a mixed-radix number: the last digit varies fastest.
        var chars = [Character](repeating: " ", count: options.count)
        var rest = k
        for j in stride(from: options.count - 1, through: 0, by: -1) {
            let letters = options[j]
            chars[j] = letters[rest % letters.count]
            rest /= letters.count
        }
        result.append(String(chars))
    }
    return result
}
