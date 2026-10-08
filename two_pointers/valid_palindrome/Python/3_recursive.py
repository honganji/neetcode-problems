def is_palindrome(s: str) -> bool:
    cleaned = [c.lower() for c in s if c.isalnum()]

    def check(left: int, right: int) -> bool:
        if left >= right:
            return True
        if cleaned[left] != cleaned[right]:
            return False
        return check(left + 1, right - 1)

    return check(0, len(cleaned) - 1)
