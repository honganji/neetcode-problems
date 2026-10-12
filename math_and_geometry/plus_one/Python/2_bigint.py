def plus_one(digits: list[int]) -> list[int]:
    # Python integers have arbitrary precision, so join the digits into one number and add 1.
    number = int("".join(map(str, digits))) + 1
    return [int(d) for d in str(number)]
