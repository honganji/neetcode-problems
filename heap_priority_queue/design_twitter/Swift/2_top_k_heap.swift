class Twitter {
    private var time = 0
    private var tweets: [Int: [(time: Int, tweetId: Int)]] = [:]
    private var following: [Int: Set<Int>] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        time += 1
        tweets[userId, default: []].append((time: time, tweetId: tweetId))
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        // Min-heap capped at 10 entries: the oldest is dropped when it overflows,
        // so it always holds the 10 newest tweets seen so far.
        var top = Heap<(time: Int, tweetId: Int)>(by: { $0.time < $1.time })
        for uid in (following[userId] ?? []).union([userId]) {
            for tweet in tweets[uid] ?? [] {
                top.push(tweet)
                if top.count > 10 {
                    _ = top.pop()
                }
            }
        }
        return top.elements.sorted { $0.time > $1.time }.map { $0.tweetId }
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}

// Binary heap. `isHigherPriority(a, b)` means a should come out before b.
struct Heap<Element> {
    private var items: [Element] = []
    private let isHigherPriority: (Element, Element) -> Bool

    init(by isHigherPriority: @escaping (Element, Element) -> Bool) {
        self.isHigherPriority = isHigherPriority
    }

    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
    var elements: [Element] { items }

    mutating func push(_ item: Element) {
        items.append(item)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            guard isHigherPriority(items[i], items[parent]) else { break }
            items.swapAt(i, parent)
            i = parent
        }
    }

    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        items.swapAt(0, items.count - 1)
        let top = items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var best = i
            if left < items.count && isHigherPriority(items[left], items[best]) {
                best = left
            }
            if right < items.count && isHigherPriority(items[right], items[best]) {
                best = right
            }
            if best == i { break }
            items.swapAt(i, best)
            i = best
        }
        return top
    }
}
