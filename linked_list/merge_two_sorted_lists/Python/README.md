# Merge Two Sorted Lists — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative with Dummy Head — `1_iterative_dummy.py`

Both lists are already sorted, so the smallest remaining value is always at
the front of one of them. Keep a `tail` pointer on the end of the merged list,
compare the two current heads, attach the smaller one to `tail`, and advance
that list. When one list runs out, the other is already sorted, so just attach
whatever is left of it. The dummy node exists only so `tail` has somewhere to
start — it saves a special case for the very first node, and the real answer
is `dummy.next`.

- Time: O(m + n)
- Space: O(1) — existing nodes are relinked, nothing new is allocated

## 2. Recursive — `2_recursive.py`

Think of the merged list as "the smaller of the two heads, followed by the
merge of everything else." If either list is empty, the answer is simply the
other list. Otherwise pick the head with the smaller value, set its `next` to
the result of merging the rest, and return it. Each call peels off exactly one
node, so the recursion is a clean restatement of the iterative idea.

- Time: O(m + n)
- Space: O(m + n) for the recursion stack, one frame per node

## 3. Collect and Sort — `3_collect_and_sort.py`

Ignore the fact that the inputs are sorted: walk both lists, dump every value
into an array, sort the array, and build a brand-new list from it. This is
correct but wasteful, because sorting throws away the order the inputs already
had and the new list duplicates every node.

- Time: O((m + n) log(m + n)) for the sort
- Space: O(m + n) for the value array and the new nodes
