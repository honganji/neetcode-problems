from collections import deque
from typing import Optional


class Node:
    def __init__(self, val: int = 0, neighbors: Optional[list["Node"]] = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


def clone_graph(node: Optional[Node]) -> Optional[Node]:
    if node is None:
        return None

    copies = {node: Node(node.val)}
    queue = deque([node])

    while queue:
        current = queue.popleft()
        for neighbor in current.neighbors:
            if neighbor not in copies:
                # First time we see this neighbor: make its copy and schedule it.
                copies[neighbor] = Node(neighbor.val)
                queue.append(neighbor)
            copies[current].neighbors.append(copies[neighbor])

    return copies[node]
