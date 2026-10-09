# Best Time to Buy and Sell Stock — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Sliding Window — `1_sliding_window.py`

Keep two pointers: `left` is the day you buy and `right` is the day you
sell, with `right` always after `left`. Slide `right` forward one day at a
time. If the price on `right` is lower than the price on `left`, there is no
reason to keep the old buy day — any future sale would do better buying here
instead, so jump `left` up to `right`. Otherwise the window is a real buy/sell
pair, so record its profit if it beats the best so far. The window only ever
grows forward or restarts, so every day is visited once.

- Time: O(n)
- Space: O(1)

## 2. Running Minimum — `2_running_min.py`

This is the same idea with the left pointer collapsed into a single number:
the cheapest price seen so far. Walk the days in order; at each day either the
price is a new low (remember it as the new best buy) or it is a candidate sell,
and the best profit from selling today is today's price minus that running
minimum. Keep the largest such profit. It does exactly the work of the sliding
window and is the formulation most people write in practice — it is ranked
second only because the two-pointer window is the pattern this category
teaches.

- Time: O(n)
- Space: O(1)

## 3. Brute Force — `3_bruteforce.py`

Try every possible buy day and, for each, every later sell day. Compute the
profit of each pair and keep the largest. Only looking forward from the buy
day guarantees you never "sell" before you buy, and starting the best profit
at 0 handles the case where every trade loses money.

- Time: O(n²)
- Space: O(1)
