import string
from typing import List


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        unvisited = set(wordList)
        if endWord not in unvisited:
            return 0

        # Search from both ends and always grow the smaller frontier.
        front, back = {beginWord}, {endWord}
        unvisited.discard(beginWord)
        unvisited.discard(endWord)
        steps = 1  # words in the path so far, counting beginWord

        while front and back:
            if len(front) > len(back):
                front, back = back, front

            next_front = set()
            for word in front:
                chars = list(word)
                for i in range(len(chars)):
                    original = chars[i]
                    for c in string.ascii_lowercase:
                        if c == original:
                            continue
                        chars[i] = c
                        candidate = "".join(chars)
                        if candidate in back:
                            return steps + 1  # the two searches meet
                        if candidate in unvisited:
                            unvisited.remove(candidate)
                            next_front.add(candidate)
                    chars[i] = original

            front = next_front
            steps += 1

        return 0
