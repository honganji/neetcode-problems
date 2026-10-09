from collections import deque


def coin_change(coins: list[int], amount: int) -> int:
    if amount == 0:
        return 0
    # Each queue level is "one more coin used"; the first time we reach amount, it's the fewest
    seen = [False] * (amount + 1)
    seen[0] = True
    queue = deque([0])
    coins_used = 0
    while queue:
        coins_used += 1
        for _ in range(len(queue)):
            total = queue.popleft()
            for c in coins:
                if c > amount - total:
                    continue  # would overshoot
                nxt = total + c
                if nxt == amount:
                    return coins_used
                if not seen[nxt]:
                    seen[nxt] = True
                    queue.append(nxt)
    return -1
