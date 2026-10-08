func isPalindrome(_ s: String) -> Bool {
    func isAlnum(_ c: UInt8) -> Bool {
        return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122)
    }

    let cleaned = Array(s.lowercased().utf8).filter(isAlnum)

    func check(_ left: Int, _ right: Int) -> Bool {
        if left >= right {
            return true
        }
        if cleaned[left] != cleaned[right] {
            return false
        }
        return check(left + 1, right - 1)
    }

    return check(0, cleaned.count - 1)
}
