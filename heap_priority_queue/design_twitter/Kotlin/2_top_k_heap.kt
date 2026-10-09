import java.util.PriorityQueue

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
        // Min-heap capped at 10 entries: the oldest is dropped when it overflows,
        // so it always holds the 10 newest tweets seen so far.
        val top = PriorityQueue<Tweet>(compareBy<Tweet> { it.time })
        for (uid in (following[userId] ?: emptySet()) + userId) {
            for (tweet in tweets[uid] ?: emptyList()) {
                top.add(tweet)
                if (top.size > 10) top.poll()
            }
        }
        return top.sortedByDescending { it.time }.map { it.tweetId }
    }

    fun follow(followerId: Int, followeeId: Int) {
        following.getOrPut(followerId) { mutableSetOf() }.add(followeeId)
    }

    fun unfollow(followerId: Int, followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}
