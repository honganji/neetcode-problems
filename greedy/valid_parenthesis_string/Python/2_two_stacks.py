def check_valid_string(s: str) -> bool:
    open_positions = []  # indices of '(' that are not matched yet
    star_positions = []  # indices of '*'
    for i, c in enumerate(s):
        if c == "(":
            open_positions.append(i)
        elif c == "*":
            star_positions.append(i)
        elif open_positions:
            # Match ')' with a real '(' first, and save '*' for later.
            open_positions.pop()
        elif star_positions:
            star_positions.pop()
        else:
            return False
    # Each leftover '(' needs a '*' after it to close it.
    while open_positions and star_positions:
        if open_positions.pop() > star_positions.pop():
            return False
    return not open_positions
