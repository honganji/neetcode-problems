## What this code is doing

This function checks whether a list of numbers has any duplicates by first **sorting** the list, then checking each element against the one right next to it. The core trick: sorting turns a "does this value appear anywhere else?" search problem into a much simpler "are these two neighbors the same?" check.

## Walking through it

```python
sorted_nums = sorted(nums)
```
This creates a brand-new list that's a sorted copy of `nums` (ascending order), using Python's built-in `sorted()`. It doesn't touch the original `nums` — `sorted_nums` is a separate list.

Why sort at all? Because once a list is sorted, any duplicate values are guaranteed to end up **right next to each other**. If `5` appears twice anywhere in the original list, after sorting both `5`s will be adjacent. That means you no longer need to compare every element against every other element — you only ever need to compare each element to the one directly before it.

```python
for i in range(1, len(sorted_nums)):
    if sorted_nums[i] == sorted_nums[i - 1]:
        return True
```
This loop walks through the sorted list starting at index `1` (not `0`, since there's no element before index `0` to compare against). At each step, it compares the current element `sorted_nums[i]` to the previous one `sorted_nums[i - 1]`. If they're equal, that's a duplicate, so the function immediately returns `True` and stops — no need to keep checking.

```python
return False
```
If the loop finishes without ever finding two equal neighbors, there are no duplicates anywhere, so it returns `False`.

## Why it matters

This is where the Big-O story (a shorthand for "how does the running time grow as the input grows") gets interesting. Sorting a list with Python's `sorted()` costs **O(n log n)** — not instant, but much better than comparing every pair of elements, which would cost O(n²). The loop afterward only costs **O(n)**, since it's a single pass. When you add those together, the sort dominates, so the whole function runs in **O(n log n)** time.

Compare that to the alternative approach of using a hash set to track numbers you've already seen: that runs in O(n) time (faster), but it needs extra O(n) space to store the set. This sorting approach is slightly slower, but uses no extra data structure (other than the sorted copy) and is simple to read. That trade-off — a bit of speed for a bit of simplicity — is a common theme in picking between algorithms.

## One thing worth remembering

When you're reasoning about how fast your code is, don't forget to account for the cost of library functions you call, not just the loops you write yourself. It's easy to assume `sorted()` or similar built-ins are "free" because you didn't write the logic, but they have their own Big-O cost, and often that hidden cost ends up being the actual bottleneck in your function.
