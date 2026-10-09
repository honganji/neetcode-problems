# LRU Cache — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Map + Doubly Linked List — `1_hashmap_doubly_linked_list.swift`

Two structures share the work. A hash map answers "does this key exist, and
where is its node?" in one lookup. A doubly linked list keeps every node in
recency order, with the most recently used entry right after a sentinel head
and the least recently used right before a sentinel tail. Because each node
knows both its neighbours, unlinking it and re-inserting it at the front takes
a handful of pointer swaps, with no searching. Eviction is just "drop the node
before the tail" and delete its key from the map. The sentinels mean there is
never a special case for an empty list or for the first and last node.

- Time: O(1) for get and put
- Space: O(capacity) for the map and the list

## 2. Ordered Map — `2_ordered_map.swift`

Swift's standard library has no insertion-ordered dictionary, so this version
pairs a regular `Dictionary` for the values with an array of keys kept in
recency order, oldest first. The dictionary still gives constant-time lookup,
but moving a key to the end of the array means finding it with a linear search
and shifting the elements after it, and evicting from the front shifts the
whole array. The structure is the same idea as an ordered map, but in Swift it
costs O(n) per operation; in Python, Kotlin, and Dart the equivalent is O(1).

- Time: O(capacity) for get and put in Swift (O(1) in languages with an
  ordered map)
- Space: O(capacity)

## 3. Array Scan — `3_array_scan.swift`

Keep a plain list of (key, value) pairs ordered from least to most recently
used. Every operation searches the list from the front to find the key; a hit
is pulled out and appended to the end so it becomes the newest entry, and when
the list is full the first element is the one to evict. It is easy to read and
makes a good reference implementation for testing, but each operation walks up
to the whole list, which breaks the constant-time requirement.

- Time: O(capacity) for get and put
- Space: O(capacity)
