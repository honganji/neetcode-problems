typedef Tweet = ({int time, int tweetId});

class Twitter {
  int _time = 0;
  final Map<int, List<Tweet>> _tweets = {};
  final Map<int, Set<int>> _following = {};

  void postTweet(int userId, int tweetId) {
    _time++;
    (_tweets[userId] ??= []).add((time: _time, tweetId: tweetId));
  }

  List<int> getNewsFeed(int userId) {
    // Gather every tweet from the user and their followees, then sort newest first.
    final candidates = <Tweet>[
      for (final uid in <int>{userId, ...?_following[userId]}) ...?_tweets[uid],
    ];
    candidates.sort((a, b) => b.time.compareTo(a.time));
    return [for (final tweet in candidates.take(10)) tweet.tweetId];
  }

  void follow(int followerId, int followeeId) {
    (_following[followerId] ??= {}).add(followeeId);
  }

  void unfollow(int followerId, int followeeId) {
    _following[followerId]?.remove(followeeId);
  }
}
