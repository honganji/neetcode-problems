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
    // Min-heap capped at 10 entries: the oldest is dropped when it overflows,
    // so it always holds the 10 newest tweets seen so far.
    final top = Heap<Tweet>((a, b) => a.time.compareTo(b.time));
    for (final uid in <int>{userId, ...?_following[userId]}) {
      for (final tweet in _tweets[uid] ?? const <Tweet>[]) {
        top.add(tweet);
        if (top.length > 10) top.removeFirst();
      }
    }
    final newestFirst = [...top.elements]
      ..sort((a, b) => b.time.compareTo(a.time));
    return [for (final tweet in newestFirst) tweet.tweetId];
  }

  void follow(int followerId, int followeeId) {
    (_following[followerId] ??= {}).add(followeeId);
  }

  void unfollow(int followerId, int followeeId) {
    _following[followerId]?.remove(followeeId);
  }
}

// Binary heap. `compare(a, b) < 0` means a should come out before b.
class Heap<T> {
  Heap(this._compare);

  final int Function(T, T) _compare;
  final List<T> _items = [];

  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
  List<T> get elements => _items;

  void add(T item) {
    _items.add(item);
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_compare(_items[i], _items[parent]) >= 0) break;
      _swap(i, parent);
      i = parent;
    }
  }

  T removeFirst() {
    _swap(0, _items.length - 1);
    final top = _items.removeLast();
    var i = 0;
    while (true) {
      final left = 2 * i + 1;
      final right = left + 1;
      var best = i;
      if (left < _items.length && _compare(_items[left], _items[best]) < 0) {
        best = left;
      }
      if (right < _items.length && _compare(_items[right], _items[best]) < 0) {
        best = right;
      }
      if (best == i) break;
      _swap(i, best);
      i = best;
    }
    return top;
  }

  void _swap(int i, int j) {
    final tmp = _items[i];
    _items[i] = _items[j];
    _items[j] = tmp;
  }
}
