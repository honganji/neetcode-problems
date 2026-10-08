def eval_rpn(tokens: list[str]) -> int:
    index = len(tokens) - 1

    def evaluate() -> int:
        nonlocal index
        token = tokens[index]
        index -= 1
        if token not in ("+", "-", "*", "/"):
            return int(token)
        b = evaluate()
        a = evaluate()
        if token == "+":
            return a + b
        if token == "-":
            return a - b
        if token == "*":
            return a * b
        return int(a / b)

    return evaluate()
