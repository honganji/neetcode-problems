from typing import List


class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # Edge prereq -> course, so following edges moves forward in the course order.
        graph = [[] for _ in range(numCourses)]
        for course, prereq in prerequisites:
            graph[prereq].append(course)

        def reaches_itself(start: int) -> bool:
            # A course is on a cycle if we can walk from it back to itself.
            seen = set()
            stack = list(graph[start])
            while stack:
                node = stack.pop()
                if node == start:
                    return True
                if node in seen:
                    continue
                seen.add(node)
                stack.extend(graph[node])
            return False

        return not any(reaches_itself(course) for course in range(numCourses))
