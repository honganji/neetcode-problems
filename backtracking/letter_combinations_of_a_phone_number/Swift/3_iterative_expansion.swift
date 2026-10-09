private let keypad: [Character: [Character]] = [
    "2": Array("abc"), "3": Array("def"), "4": Array("ghi"), "5": Array("jkl"),
    "6": Array("mno"), "7": Array("pqrs"), "8": Array("tuv"), "9": Array("wxyz"),
]

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }

    var combos = [""]
    for d in digits {
        var next: [String] = []
        for prefix in combos {
            for ch in keypad[d]! {
                next.append(prefix + String(ch))
            }
        }
        combos = next
    }
    return combos
}
