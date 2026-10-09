# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def max_path_sum(root: TreeNode | None) -> int:
    if root is None:
        return 0
    best = float("-inf")
    gains: dict[TreeNode, int] = {}
    stack: list[tuple[TreeNode, bool]] = [(root, False)]
    while stack:
        node, visited = stack.pop()
        if not visited:
            stack.append((node, True))
            if node.right is not None:
                stack.append((node.right, False))
            if node.left is not None:
                stack.append((node.left, False))
            continue
        left = max(gains.get(node.left, 0), 0) if node.left else 0
        right = max(gains.get(node.right, 0), 0) if node.right else 0
        best = max(best, node.val + left + right)
        gains[node] = node.val + max(left, right)
    return int(best)
