import heapq
from collections import defaultdict


class Twitter:
    def __init__(self):
        self.time = 0
        # Each user's tweets are stored oldest first as (time, tweetId).
        self.tweets = defaultdict(list)
        self.following = defaultdict(set)

    def postTweet(self, userId: int, tweetId: int) -> None:
        self.time += 1
        self.tweets[userId].append((self.time, tweetId))

    def getNewsFeed(self, userId: int) -> list[int]:
        sources = self.following[userId] | {userId}

        # Max-heap of each source's newest tweet (heapq is a min-heap, so negate time).
        # Entries are (-time, userId, index into that user's tweet list).
        heap = []
        for uid in sources:
            if self.tweets[uid]:
                heap.append((-self.tweets[uid][-1][0], uid, len(self.tweets[uid]) - 1))
        heapq.heapify(heap)

        feed = []
        while heap and len(feed) < 10:
            _, uid, idx = heapq.heappop(heap)
            feed.append(self.tweets[uid][idx][1])
            # That user's next-older tweet is now a candidate.
            if idx > 0:
                older_time = self.tweets[uid][idx - 1][0]
                heapq.heappush(heap, (-older_time, uid, idx - 1))
        return feed

    def follow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].add(followeeId)

    def unfollow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].discard(followeeId)
