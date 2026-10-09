class Twitter {
    private struct Entry {
        let time: Int
        let userId: Int
        let index: Int
    }

    private var time = 0
    // userId -> tweets as (time, tweetId), oldest first.
    private var tweets: [Int: [(time: Int, tweetId: Int)]] = [:]
    private var following: [Int: Set<Int>] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        time += 1
        tweets[userId, default: []].append((time: time, tweetId: tweetId))
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        let sources = (following[userId] ?? []).union([userId])

        // Max-heap on time, holding one candidate per source user.
        var heap = Heap<Entry>(by: { $0.time > $1.time })
        for uid in sources {
            if let list = tweets[uid], let last = list.last {
                heap.push(Entry(time: last.time, userId: uid, index: list.count - 1))
            }
        }

        var feed: [Int] = []
        while !heap.isEmpty && feed.count < 10 {
            let top = heap.pop()!
            let list = tweets[top.userId]!
            feed.append(list[top.index].tweetId)
            // That user's next-older tweet is now a candidate.
            if top.index > 0 {
                let older = list[top.index - 1]
                heap.push(Entry(time: older.time, userId: top.userId, index: top.index - 1))
            }
        }
        return feed
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
