from typing import List


class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        # A tree on n nodes has exactly n - 1 edges.
        if len(edges) != n - 1:
            return False

        parent = list(range(n))
        size = [1] * n

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]  # path halving
                x = parent[x]
            return x

        for a, b in edges:
            root_a, root_b = find(a), find(b)
            if root_a == root_b:
                return False  # this edge would close a cycle
            if size[root_a] < size[root_b]:
                root_a, root_b = root_b, root_a
            parent[root_b] = root_a
            size[root_a] += size[root_b]

        return True
