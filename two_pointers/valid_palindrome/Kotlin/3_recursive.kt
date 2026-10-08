fun isPalindrome(s: String): Boolean {
    val cleaned = s.filter { it.isLetterOrDigit() }.lowercase()

    fun check(left: Int, right: Int): Boolean {
        if (left >= right) {
            return true
        }
        if (cleaned[left] != cleaned[right]) {
            return false
        }
        return check(left + 1, right - 1)
    }

    return check(0, cleaned.length - 1)
}
