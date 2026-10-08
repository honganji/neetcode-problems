# Valid Parentheses — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Stack — `1_stack.kt`

The most recently opened bracket must be the first one closed, which is
exactly what a stack gives you: last in, first out. Walk the string once,
pushing every opening bracket. When you meet a closing bracket, pop the top of
the stack and check it is the matching opener (a small map from closer to
opener makes that lookup trivial). If the stack is empty when you need to pop,
or the popped bracket doesn't match, the string is invalid. At the end the
stack must be empty, otherwise something was opened and never closed.

- Time: O(n)
- Space: O(n) for the stack in the worst case (all openers)

## 2. Replace Pairs — `2_replace_pairs.kt`

A valid string always contains at least one innermost pair sitting directly
next to each other: `()`, `[]` or `{}`. Delete every such pair and the
string that remains is valid if and only if the original was, so just keep
deleting until nothing changes. If you end with an empty string the input was
valid; if something is left over (like `(]` or a lone `(`) it was not. Each
pass over the string costs linear time and there can be up to n/2 passes, which
is why this is much slower than the stack.

- Time: O(n²)
- Space: O(n) for the rebuilt string each pass

## 3. Recursive Matching — `3_recursive_matching.kt`

Think of the string as a sequence of balanced groups, where each group is an
opener, zero or more inner groups, and the matching closer. A helper `parse(i)`
takes the position of an opener, recursively parses each inner group, and
returns the index just after the group's closer (or -1 if the structure breaks
down). The top level repeatedly parses groups until the string is consumed.
Every character is visited once, but the recursion depth equals the nesting
depth, so a long run of openers like `((((...` can overflow the call stack,
and function-call overhead makes it slower in practice than the explicit stack.

- Time: O(n)
- Space: O(n) for the call stack at maximum nesting depth
