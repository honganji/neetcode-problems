# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_balanced(root: TreeNode | None) -> bool:
    heights: dict[TreeNode, int] = {}
    stack: list[tuple[TreeNode, bool]] = [(root, False)] if root else []
    while stack:
        node, visited = stack.pop()
        if visited:
            left = heights.get(node.left, 0)
            right = heights.get(node.right, 0)
            if abs(left - right) > 1:
                return False
            heights[node] = 1 + max(left, right)
        else:
            stack.append((node, True))
            if node.right:
                stack.append((node.right, False))
            if node.left:
                stack.append((node.left, False))
    return True
