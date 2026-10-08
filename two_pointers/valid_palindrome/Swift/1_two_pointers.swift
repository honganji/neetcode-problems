func isPalindrome(_ s: String) -> Bool {
    func isAlnum(_ c: UInt8) -> Bool {
        return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122)
    }
    func lower(_ c: UInt8) -> UInt8 {
        return (c >= 65 && c <= 90) ? c + 32 : c
    }

    let bytes = Array(s.utf8)
    var left = 0
    var right = bytes.count - 1
    while left < right {
        while left < right && !isAlnum(bytes[left]) {
            left += 1
        }
        while left < right && !isAlnum(bytes[right]) {
            right -= 1
        }
        if lower(bytes[left]) != lower(bytes[right]) {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
