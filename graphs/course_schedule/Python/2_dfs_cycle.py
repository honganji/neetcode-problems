from typing import List


class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        graph = [[] for _ in range(numCourses)]
        for course, prereq in prerequisites:
            graph[course].append(prereq)

        # 0 = not visited, 1 = on the current DFS path, 2 = fully explored (no cycle through it)
        state = [0] * numCourses
        next_edge = [0] * numCourses  # index of the next prerequisite to check for each course

        # Iterative DFS, so long prerequisite chains don't hit Python's recursion limit.
        for start in range(numCourses):
            if state[start] != 0:
                continue
            state[start] = 1
            stack = [start]
            while stack:
                node = stack[-1]
                if next_edge[node] < len(graph[node]):
                    nxt = graph[node][next_edge[node]]
                    next_edge[node] += 1
                    if state[nxt] == 1:  # back edge to the current path -> cycle
                        return False
                    if state[nxt] == 0:
                        state[nxt] = 1
                        stack.append(nxt)
                else:
                    state[node] = 2
                    stack.pop()
        return True
