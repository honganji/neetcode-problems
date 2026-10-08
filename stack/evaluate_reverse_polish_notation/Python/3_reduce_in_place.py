def eval_rpn(tokens: list[str]) -> int:
    tokens = list(tokens)
    while len(tokens) > 1:
        i = 0
        while tokens[i] not in ("+", "-", "*", "/"):
            i += 1
        a = int(tokens[i - 2])
        b = int(tokens[i - 1])
        op = tokens[i]
        if op == "+":
            result = a + b
        elif op == "-":
            result = a - b
        elif op == "*":
            result = a * b
        else:
            result = int(a / b)
        tokens[i - 2 : i + 1] = [str(result)]
    return int(tokens[0])
