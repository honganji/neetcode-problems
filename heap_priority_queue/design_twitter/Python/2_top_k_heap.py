import heapq
from collections import defaultdict


class Twitter:
    def __init__(self):
        self.time = 0
        self.tweets = defaultdict(list)  # userId -> [(time, tweetId)], oldest first
        self.following = defaultdict(set)

    def postTweet(self, userId: int, tweetId: int) -> None:
        self.time += 1
        self.tweets[userId].append((self.time, tweetId))

    def getNewsFeed(self, userId: int) -> list[int]:
        # Min-heap that never holds more than 10 tweets: once it is full, the
        # oldest tweet is dropped, so it always keeps the 10 newest seen so far.
        top = []
        for uid in self.following[userId] | {userId}:
            for entry in self.tweets[uid]:
                heapq.heappush(top, entry)
                if len(top) > 10:
                    heapq.heappop(top)
        return [tweetId for _, tweetId in sorted(top, reverse=True)]

    def follow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].add(followeeId)

    def unfollow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].discard(followeeId)
