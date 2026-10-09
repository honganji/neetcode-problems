from typing import List


class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        next_courses = [[] for _ in range(numCourses)]
        for course, prereq in prerequisites:
            next_courses[prereq].append(course)

        # 0 = unvisited, 1 = on the current path, 2 = finished
        state = [0] * numCourses
        order = []  # a course is added after every course that depends on it

        # Iterative DFS, so long prerequisite chains don't hit Python's recursion limit
        for start in range(numCourses):
            if state[start] != 0:
                continue
            state[start] = 1
            stack = [(start, iter(next_courses[start]))]
            while stack:
                course, children = stack[-1]
                child = next(children, None)
                if child is None:
                    state[course] = 2
                    order.append(course)
                    stack.pop()
                elif state[child] == 1:
                    return []  # reached a course on the current path -> cycle
                elif state[child] == 0:
                    state[child] = 1
                    stack.append((child, iter(next_courses[child])))

        return order[::-1]
