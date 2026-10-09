def merge_triplets(triplets: list[list[int]], target: list[int]) -> bool:
    x, y, z = target
    n = len(triplets)
    # Try every choice of up to three triplets (repeats allowed).
    for i in range(n):
        for j in range(n):
            for k in range(n):
                a = max(triplets[i][0], triplets[j][0], triplets[k][0])
                b = max(triplets[i][1], triplets[j][1], triplets[k][1])
                c = max(triplets[i][2], triplets[j][2], triplets[k][2])
                if a == x and b == y and c == z:
                    return True
    return False
