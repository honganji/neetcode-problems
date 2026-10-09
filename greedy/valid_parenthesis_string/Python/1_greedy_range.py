def check_valid_string(s: str) -> bool:
    # lo and hi are the fewest and most '(' that could still be open so far.
    lo = hi = 0
    for c in s:
        if c == "(":
            lo, hi = lo + 1, hi + 1
        elif c == ")":
            lo, hi = lo - 1, hi - 1
        else:
            # '*' can close one '(' (lo - 1), open one (hi + 1), or be empty.
            lo, hi = lo - 1, hi + 1
        if hi < 0:
            # Even treating every '*' as '(' there is no '(' left for a ')'.
            return False
        lo = max(lo, 0)  # a '*' can always be empty, so lo never goes below 0
    return lo == 0
