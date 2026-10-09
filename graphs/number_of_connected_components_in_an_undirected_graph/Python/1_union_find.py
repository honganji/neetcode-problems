from typing import List


class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        parent = list(range(n))
        size = [1] * n
        components = n

        def find(x: int) -> int:
            # Path halving: point each visited node at its grandparent.
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        for a, b in edges:
            root_a, root_b = find(a), find(b)
            if root_a == root_b:
                continue  # already in the same group
            # Attach the smaller group under the bigger one.
            if size[root_a] < size[root_b]:
                root_a, root_b = root_b, root_a
            parent[root_b] = root_a
            size[root_a] += size[root_b]
            components -= 1  # two groups became one

        return components
