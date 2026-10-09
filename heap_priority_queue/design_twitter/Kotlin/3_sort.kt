class Twitter {
    private data class Tweet(val time: Int, val tweetId: Int)

    private var time = 0
    private val tweets = HashMap<Int, MutableList<Tweet>>()
    private val following = HashMap<Int, MutableSet<Int>>()

    fun postTweet(userId: Int, tweetId: Int) {
        time++
        tweets.getOrPut(userId) { mutableListOf() }.add(Tweet(time, tweetId))
    }

    fun getNewsFeed(userId: Int): List<Int> {
        // Gather every tweet from the user and their followees, then sort newest first.
        val candidates = mutableListOf<Tweet>()
        for (uid in (following[userId] ?: emptySet()) + userId) {
            tweets[uid]?.let { candidates.addAll(it) }
        }
        return candidates.sortedByDescending { it.time }.take(10).map { it.tweetId }
    }

    fun follow(followerId: Int, followeeId: Int) {
        following.getOrPut(followerId) { mutableSetOf() }.add(followeeId)
    }

    fun unfollow(followerId: Int, followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}
