from collections import deque
from typing import List


class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # next_courses[p] = courses that become one step closer to unlocked once p is taken
        next_courses = [[] for _ in range(numCourses)]
        indegree = [0] * numCourses  # number of unfinished prerequisites per course
        for course, prereq in prerequisites:
            next_courses[prereq].append(course)
            indegree[course] += 1

        queue = deque(c for c in range(numCourses) if indegree[c] == 0)
        order = []
        while queue:
            course = queue.popleft()
            order.append(course)
            for nxt in next_courses[course]:
                indegree[nxt] -= 1
                if indegree[nxt] == 0:
                    queue.append(nxt)

        # Courses left out are stuck in a cycle
        return order if len(order) == numCourses else []
