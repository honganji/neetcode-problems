from typing import List


class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        prereqs = [[] for _ in range(numCourses)]
        for course, prereq in prerequisites:
            prereqs[course].append(prereq)

        taken = [False] * numCourses
        order = []
        while len(order) < numCourses:
            progress = False
            for course in range(numCourses):
                if not taken[course] and all(taken[p] for p in prereqs[course]):
                    taken[course] = True
                    order.append(course)
                    progress = True
            if not progress:
                return []  # every remaining course waits on another one -> cycle
        return order
