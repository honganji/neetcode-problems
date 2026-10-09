from typing import Optional


class Node:
    def __init__(self, val: int = 0, neighbors: Optional[list["Node"]] = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


def clone_graph(node: Optional[Node]) -> Optional[Node]:
    copies: dict[Node, Node] = {}

    def clone(original: Node) -> Node:
        if original in copies:
            return copies[original]

        # Register the copy before visiting neighbors, so cycles stop here.
        copy = Node(original.val)
        copies[original] = copy
        for neighbor in original.neighbors:
            copy.neighbors.append(clone(neighbor))
        return copy

    if node is None:
        return None
    return clone(node)
