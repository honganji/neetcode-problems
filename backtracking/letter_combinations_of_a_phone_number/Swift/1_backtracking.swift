private let keypad: [Character: [Character]] = [
    "2": Array("abc"), "3": Array("def"), "4": Array("ghi"), "5": Array("jkl"),
    "6": Array("mno"), "7": Array("pqrs"), "8": Array("tuv"), "9": Array("wxyz"),
]

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }

    let options = digits.map { keypad[$0]! }
    var result: [String] = []
    var path: [Character] = []

    func backtrack(_ i: Int) {
        if i == options.count {
            result.append(String(path))
            return
        }
        for ch in options[i] {
            path.append(ch)
            backtrack(i + 1)
            path.removeLast()
        }
    }

    backtrack(0)
    return result
}
