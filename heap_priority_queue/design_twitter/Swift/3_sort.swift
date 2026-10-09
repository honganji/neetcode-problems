class Twitter {
    private var time = 0
    private var tweets: [Int: [(time: Int, tweetId: Int)]] = [:]
    private var following: [Int: Set<Int>] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        time += 1
        tweets[userId, default: []].append((time: time, tweetId: tweetId))
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        // Gather every tweet from the user and their followees, then sort newest first.
        var candidates: [(time: Int, tweetId: Int)] = []
        for uid in (following[userId] ?? []).union([userId]) {
            candidates += tweets[uid] ?? []
        }
        candidates.sort { $0.time > $1.time }
        return candidates.prefix(10).map { $0.tweetId }
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}
