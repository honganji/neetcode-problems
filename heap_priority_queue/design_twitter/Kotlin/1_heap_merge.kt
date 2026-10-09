import java.util.PriorityQueue

class Twitter {
    private data class Tweet(val time: Int, val tweetId: Int)
    private data class Entry(val time: Int, val userId: Int, val index: Int)

    private var time = 0
    // userId -> tweets, oldest first.
    private val tweets = HashMap<Int, MutableList<Tweet>>()
    private val following = HashMap<Int, MutableSet<Int>>()

    fun postTweet(userId: Int, tweetId: Int) {
        time++
        tweets.getOrPut(userId) { mutableListOf() }.add(Tweet(time, tweetId))
    }

    fun getNewsFeed(userId: Int): List<Int> {
        val sources = (following[userId] ?: emptySet()) + userId

        // Max-heap on time, holding one candidate per source user.
        val heap = PriorityQueue<Entry>(compareByDescending<Entry> { it.time })
        for (uid in sources) {
            val list = tweets[uid] ?: continue
            if (list.isNotEmpty()) heap.add(Entry(list.last().time, uid, list.size - 1))
        }

        val feed = mutableListOf<Int>()
        while (heap.isNotEmpty() && feed.size < 10) {
            val top = heap.poll()
            val list = tweets.getValue(top.userId)
            feed.add(list[top.index].tweetId)
            // That user's next-older tweet is now a candidate.
            if (top.index > 0) {
                heap.add(Entry(list[top.index - 1].time, top.userId, top.index - 1))
            }
        }
        return feed
    }

    fun follow(followerId: Int, followeeId: Int) {
        following.getOrPut(followerId) { mutableSetOf() }.add(followeeId)
    }

    fun unfollow(followerId: Int, followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}
