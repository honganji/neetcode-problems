# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right

from collections import deque


class Codec:
    def serialize(self, root: TreeNode | None) -> str:
        if root is None:
            return ""
        tokens: list[str] = []
        queue: deque[TreeNode | None] = deque([root])
        while queue:
            node = queue.popleft()
            if node is None:
                tokens.append("N")
                continue
            tokens.append(str(node.val))
            queue.append(node.left)
            queue.append(node.right)
        return ",".join(tokens)

    def deserialize(self, data: str) -> TreeNode | None:
        if data == "":
            return None
        tokens = data.split(",")
        root = TreeNode(int(tokens[0]))
        queue: deque[TreeNode] = deque([root])
        i = 1
        while queue and i < len(tokens):
            node = queue.popleft()
            if tokens[i] != "N":
                node.left = TreeNode(int(tokens[i]))
                queue.append(node.left)
            i += 1
            if i < len(tokens) and tokens[i] != "N":
                node.right = TreeNode(int(tokens[i]))
                queue.append(node.right)
            i += 1
        return root
