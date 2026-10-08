def is_valid(s: str) -> bool:
    while True:
        reduced = s.replace("()", "").replace("[]", "").replace("{}", "")
        if reduced == s:
            return s == ""
        s = reduced
