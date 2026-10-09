# Design Twitter — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Heap Merge — `1_heap_merge.swift`

Each user's tweets are stored in the order they were posted, so every list is already sorted by time. To build the feed, treat it like merging several sorted lists. Put the newest tweet from each user you follow (and yourself) into a max-heap keyed by time. Pop the newest one, add it to the feed, then push that same user's next-older tweet. Stop after 10 tweets. The heap never holds more than one tweet per followed user, so it stays small. Swift has no built-in heap, so the file includes a small `Heap` struct.

- Time: O(F + 10 log F) per `getNewsFeed`, where F is the number of users in the feed (you plus your followees). `postTweet`, `follow` and `unfollow` are O(1).
- Space: O(F) for the heap

## 2. Top-K Heap — `2_top_k_heap.swift`

Instead of merging, look at every tweet that could appear in the feed and keep only the 10 newest. Use a min-heap that holds at most 10 items. Its smallest (oldest) item sits at the top, so whenever it grows past 10 you remove the oldest. What is left at the end are the 10 newest tweets, which are then sorted for output.

- Time: O(T log 10), which is O(T), per `getNewsFeed`, where T is the total number of tweets from you and your followees
- Space: O(1) extra, since the heap never holds more than 11 items

## 3. Sort All Tweets — `3_sort.swift`

The most direct idea: gather every tweet from you and your followees into one list, sort it newest first, and return the first 10. It is correct, but it does more work than needed, because only the top 10 are ever used.

- Time: O(T log T) per `getNewsFeed`, where T is the total number of tweets from you and your followees
- Space: O(T) for the gathered list
