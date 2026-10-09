from collections import defaultdict, deque
from typing import List


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        # Group words by wildcard patterns: "h*t" holds hit, hot, ...
        buckets = defaultdict(list)
        for word in wordList:
            for i in range(len(word)):
                buckets[word[:i] + "*" + word[i + 1:]].append(word)

        visited = {beginWord}
        queue = deque([(beginWord, 1)])
        while queue:
            word, count = queue.popleft()
            if word == endWord:
                return count
            for i in range(len(word)):
                pattern = word[:i] + "*" + word[i + 1:]
                # pop so each bucket is expanded only once
                for neighbor in buckets.pop(pattern, []):
                    if neighbor not in visited:
                        visited.add(neighbor)
                        queue.append((neighbor, count + 1))

        return 0
