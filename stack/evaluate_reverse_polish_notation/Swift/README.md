# Evaluate Reverse Polish Notation — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Stack — `1_stack.swift`

In Reverse Polish Notation an operator always comes right after the two values
it applies to, so you never need to look ahead. Walk through the tokens once,
pushing every number onto a stack. When you meet an operator, pop the top two
numbers (the second pop is the left operand), apply the operator, and push the
result back so it can serve as an operand for a later operator. The expression
is guaranteed valid, so when the tokens run out exactly one number is left on
the stack, and that is the answer. Swift's `/` on `Int` already truncates
toward zero, exactly as the problem requires.

- Time: O(n)
- Space: O(n) for the stack

## 2. Recursion — `2_recursion.swift`

Read the token list from the end instead of the beginning. The last token is
always the root of the expression: if it is a number the whole expression is
that number, and if it is an operator, the tokens just before it form its
right operand followed by its left operand. So a recursive `evaluate` call
consumes one token, and if that token is an operator it calls itself twice
(right first, then left) to build the two sub-results before combining them.
A shared index moving backwards keeps track of which token to read next. This
is the same work as the stack version, but the call stack stands in for the
explicit stack, and deep expressions can hit the recursion limit.

- Time: O(n)
- Space: O(n) for the recursion depth

## 3. Reduce In Place — `3_reduce_in_place.swift`

Treat the token list like a worksheet and simplify it step by step. Scan from
the left for the first operator; because it is the first one, the two tokens
right before it must be plain numbers. Apply the operator to them and splice
the single result back into the list in their place. Repeat until only one
token remains. Each pass rescans from the start and shifts the tail of the
list, so this does far more work than the stack approach, but it mirrors how
you would evaluate RPN by hand.

- Time: O(n²)
- Space: O(n) for the working copy of the list
