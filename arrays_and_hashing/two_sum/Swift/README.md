# Two Sum — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Map — `1_hashmap.swift`

Walk through the array once, remembering each number and its index in a map.
Before storing the current number, ask: "have I already seen the number that
would pair with this one to hit the target?" That partner is simply
`target - current`. If the map has it, you're done — return the stored index
and the current one. Because every element is checked against earlier ones
only, you never pair an element with itself.

- Time: O(n)
- Space: O(n) for the map

## 2. Sorting + Two Pointers — `2_sorting.swift`

Sorting puts the numbers in order, but the answer needs the original
positions, so sort a list of indices by the values they point to instead. Then
place one pointer at the smallest value and one at the largest. If the two
values add up to less than the target, move the left pointer right to make the
sum bigger; if they add up to more, move the right pointer left to make it
smaller. The pointers close in until they land on the pair.

- Time: O(n log n) for the sort
- Space: O(n) for the sorted index list

## 3. Brute Force — `3_bruteforce.swift`

Try every pair of elements. For each element, look at every element after it
and check whether the two add up to the target. Only looking forward means no
pair is checked twice and an element is never paired with itself.

- Time: O(n²)
- Space: O(1)
