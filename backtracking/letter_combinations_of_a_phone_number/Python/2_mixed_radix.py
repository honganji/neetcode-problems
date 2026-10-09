KEYPAD = {
    "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
    "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz",
}


def letter_combinations(digits: str) -> list[str]:
    if not digits:
        return []

    options = [KEYPAD[d] for d in digits]
    total = 1
    for letters in options:
        total *= len(letters)

    result: list[str] = []
    for k in range(total):
        # Decode k like a mixed-radix number: the last digit varies fastest.
        chars: list[str] = []
        rest = k
        for letters in reversed(options):
            rest, idx = divmod(rest, len(letters))
            chars.append(letters[idx])
        result.append("".join(reversed(chars)))
    return result
