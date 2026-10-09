# Add Two Numbers — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative with Carry — `1_iterative_carry.py`

Because the digits are stored least-significant first, the lists are already
laid out the way you add by hand: start at the ones place and move left. Walk
both lists together, adding the two current digits plus whatever carry came
from the previous column. The ones digit of that total becomes a new node, and
the tens digit becomes the carry for the next step. A dummy head lets you
append nodes without special-casing the first one, and looping while either
list or the carry is non-zero handles different lengths and a final carry
(like 5 + 5 = 10) for free.

- Time: O(max(m, n))
- Space: O(1) extra beyond the output list

## 2. Recursive with Carry — `2_recursive_carry.py`

Adding one column and then "doing the same thing for the rest" is naturally
recursive. A helper takes the two current nodes and the incoming carry, builds
one node for this column, and asks itself to build the remainder from the
next nodes and the new carry. The recursion stops when both lists are
exhausted and there is nothing left to carry, returning `None` as the end of
the list. It is the same arithmetic as the iterative version, but each
pending call sits on the stack until the deeper ones return.

- Time: O(max(m, n))
- Space: O(max(m, n)) for the recursion stack

## 3. In-Place Reuse — `3_in_place_reuse.py`

Instead of building a fresh result, write each column's digit straight into
the first list's node and carry on. When the first list runs out but the
second still has digits, splice the rest of the second list onto the result
and keep propagating the carry through those nodes. The only node ever
created is a final one for a leftover carry, so this allocates almost
nothing. The trade-off is that it destroys both inputs, which is usually
frowned upon unless the caller explicitly expects it — hence it ranks last
despite matching the best time and space.

- Time: O(max(m, n))
- Space: O(1), and at most one new node; mutates the input lists
