from collections import deque
from typing import List


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        words = list(set(wordList) | {beginWord})
        index = {word: i for i, word in enumerate(words)}
        if endWord not in index:
            return 0

        # Build the full graph: connect every pair of words that differ by one letter.
        graph = [[] for _ in words]
        for i in range(len(words)):
            for j in range(i + 1, len(words)):
                if sum(a != b for a, b in zip(words[i], words[j])) == 1:
                    graph[i].append(j)
                    graph[j].append(i)

        # Plain BFS on the explicit graph.
        start, end = index[beginWord], index[endWord]
        dist = [0] * len(words)  # 0 = unvisited
        dist[start] = 1
        queue = deque([start])
        while queue:
            node = queue.popleft()
            if node == end:
                return dist[node]
            for nxt in graph[node]:
                if dist[nxt] == 0:
                    dist[nxt] = dist[node] + 1
                    queue.append(nxt)

        return 0
