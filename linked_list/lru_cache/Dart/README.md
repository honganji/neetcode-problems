# LRU Cache — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Map + Doubly Linked List — `1_hashmap_doubly_linked_list.dart`

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

## 2. Ordered Map — `2_ordered_map.dart`

Dart's default `Map` is a `LinkedHashMap`, which iterates keys in insertion
order and removes or inserts in constant time. There is no "move to end"
call, but removing a key and inserting it again puts it at the back, which is
the same thing. A `get` removes and re-inserts the key; a `put` removes any
old entry, evicts `keys.first` if the map is at capacity, and then inserts.
Reading `keys.first` on a linked hash map is constant time because the
iterator starts at the oldest entry.

- Time: O(1) for get and put
- Space: O(capacity)

## 3. Array Scan — `3_array_scan.dart`

Keep a plain list of (key, value) pairs ordered from least to most recently
used. Every operation searches the list from the front to find the key; a hit
is pulled out and appended to the end so it becomes the newest entry, and when
the list is full the first element is the one to evict. It is easy to read and
makes a good reference implementation for testing, but each operation walks up
to the whole list, which breaks the constant-time requirement.

- Time: O(capacity) for get and put
- Space: O(capacity)
