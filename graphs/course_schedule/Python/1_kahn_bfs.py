from collections import deque
from typing import List


class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        graph = [[] for _ in range(numCourses)]
        indegree = [0] * numCourses  # how many prerequisites each course still waits on
        for course, prereq in prerequisites:
            graph[prereq].append(course)
            indegree[course] += 1

        # Start with courses that have no prerequisites.
        queue = deque(i for i in range(numCourses) if indegree[i] == 0)
        finished = 0
        while queue:
            node = queue.popleft()
            finished += 1
            for nxt in graph[node]:
                indegree[nxt] -= 1
                if indegree[nxt] == 0:
                    queue.append(nxt)

        # If a cycle exists, its courses never reach indegree 0.
        return finished == numCourses
