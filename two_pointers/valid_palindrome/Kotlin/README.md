# Valid Palindrome — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Two Pointers — `1_two_pointers.kt`

Put one pointer at the start of the string and one at the end, and walk them
toward each other. Whenever a pointer sits on something that isn't a letter or
digit, nudge it inward and keep going — those characters simply don't count.
Once both pointers rest on real characters, compare them ignoring case; a
mismatch means it can't be a palindrome, so return `false` immediately. If the
pointers meet without ever disagreeing, the string is a palindrome. Nothing is
copied, so the only extra memory is the two indices.

- Time: O(n)
- Space: O(1)

## 2. Filter and Reverse — `2_filter_and_reverse.kt`

First build a cleaned-up copy of the input that keeps only letters and digits,
all lowercased. A palindrome is by definition a string that equals its own
reverse, so reverse the cleaned copy and check whether the two are the same.
This is the most direct translation of the problem statement into code, at the
cost of holding a second copy of the string in memory.

- Time: O(n)
- Space: O(n) for the cleaned copy and its reverse

## 3. Recursive — `3_recursive.kt`

Clean the string as in approach 2, then define the check recursively: a string
of length zero or one is a palindrome; otherwise it's a palindrome exactly when
its first and last characters match *and* the piece between them is also a
palindrome. Each call strips one character from each end and hands the middle
to the next call. It's the same comparisons as the two-pointer walk, but every
step adds a frame to the call stack, so long inputs can overflow it.

- Time: O(n)
- Space: O(n) for the cleaned copy plus the recursion depth
