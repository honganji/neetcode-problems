def check_valid_string(s: str) -> bool:
    n = len(s)
    # valid[i][j] is True if s[i:j] can be made into a valid string.
    valid = [[False] * (n + 1) for _ in range(n + 1)]
    for i in range(n + 1):
        valid[i][i] = True  # the empty string is valid

    for length in range(1, n + 1):
        for i in range(n - length + 1):
            j = i + length
            if s[i] == "*" and valid[i + 1][j]:
                # This '*' is an empty string.
                valid[i][j] = True
            elif s[i] != ")":
                # s[i] opens a pair that is closed by some s[k].
                for k in range(i + 1, j):
                    if s[k] != "(" and valid[i + 1][k] and valid[k + 1][j]:
                        valid[i][j] = True
                        break
    return valid[0][n]
