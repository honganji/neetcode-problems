from collections import defaultdict


class Twitter:
    def __init__(self):
        self.time = 0
        self.tweets = defaultdict(list)  # userId -> [(time, tweetId)]
        self.following = defaultdict(set)

    def postTweet(self, userId: int, tweetId: int) -> None:
        self.time += 1
        self.tweets[userId].append((self.time, tweetId))

    def getNewsFeed(self, userId: int) -> list[int]:
        # Gather every tweet from the user and their followees, then sort newest first.
        candidates = []
        for uid in self.following[userId] | {userId}:
            candidates.extend(self.tweets[uid])
        candidates.sort(reverse=True)
        return [tweetId for _, tweetId in candidates[:10]]

    def follow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].add(followeeId)

    def unfollow(self, followerId: int, followeeId: int) -> None:
        self.following[followerId].discard(followeeId)
