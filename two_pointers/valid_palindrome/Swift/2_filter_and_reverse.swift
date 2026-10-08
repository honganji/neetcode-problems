func isPalindrome(_ s: String) -> Bool {
    func isAlnum(_ c: UInt8) -> Bool {
        return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122)
    }

    let cleaned = Array(s.lowercased().utf8).filter(isAlnum)
    return cleaned == Array(cleaned.reversed())
}
