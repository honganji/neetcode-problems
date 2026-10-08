def generate_parenthesis(n: int) -> list[str]:
    table = [[""]]
    for size in range(1, n + 1):
        combos = []
        for inner in range(size):
            for left in table[inner]:
                for right in table[size - 1 - inner]:
                    combos.append("(" + left + ")" + right)
        table.append(combos)
    return table[n]
