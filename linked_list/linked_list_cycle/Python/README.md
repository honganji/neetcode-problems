# Linked List Cycle — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Floyd's Tortoise and Hare — `1_floyd_tortoise_hare.py`

Send two pointers down the list, one moving a single node per step and one
moving two. If the list ends, the fast pointer hits the end first and there
is no cycle. If there is a cycle, both pointers eventually get trapped
inside it, and because the fast one gains exactly one node on the slow one
every step, it must land on the same node as the slow one within one lap.
Meeting on the same node is the proof — return `True`.

- Time: O(n)
- Space: O(1)

## 2. Hash Set — `2_hashset.py`

Walk the list and drop every node you pass into a set. Nodes are compared by
identity, not value, so two different nodes holding the same number are not
confused. If the node you are about to visit is already in the set, you have
come around to it a second time, which can only happen with a cycle. Reaching
the end of the list means every node was new.

- Time: O(n)
- Space: O(n) for the set

## 3. Node Count Bound — `3_node_count_bound.py`

The problem guarantees at most 10,000 nodes. In a cycle-free list you can
take at most 10,000 steps before running off the end, so if you manage to
take a 10,001st step you must be going around in circles. This is a trick
that leans entirely on the stated constraint rather than on the structure
of the list, so it is not a general solution, but it shows how a bound in
the problem statement can be turned into a termination test.

- Time: O(n) (bounded by the constraint)
- Space: O(1)
