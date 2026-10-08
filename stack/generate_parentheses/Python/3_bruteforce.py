def generate_parenthesis(n: int) -> list[str]:
    def is_valid(s: str) -> bool:
        balance = 0
        for ch in s:
            balance += 1 if ch == "(" else -1
            if balance < 0:
                return False
        return balance == 0

    result = []
    total = 2 * n
    for mask in range(1 << total):
        chars = []
        for i in range(total):
            chars.append("(" if (mask >> i) & 1 else ")")
        candidate = "".join(chars)
        if is_valid(candidate):
            result.append(candidate)
    return result
