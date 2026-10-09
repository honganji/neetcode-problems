# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_same_tree(p: TreeNode | None, q: TreeNode | None) -> bool:
    def serialize(node: TreeNode | None) -> str:
        parts = []
        stack = [node]
        while stack:
            current = stack.pop()
            if current is None:
                parts.append("#")
                continue
            parts.append(str(current.val))
            stack.append(current.right)
            stack.append(current.left)
        return ",".join(parts)

    return serialize(p) == serialize(q)
