# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def diameter_of_binary_tree(root: TreeNode | None) -> int:
    if root is None:
        return 0
    heights: dict[TreeNode, int] = {}
    best = 0
    stack = [root]
    while stack:
        node = stack[-1]
        if node.left is not None and node.left not in heights:
            stack.append(node.left)
        elif node.right is not None and node.right not in heights:
            stack.append(node.right)
        else:
            stack.pop()
            left = heights[node.left] if node.left is not None else 0
            right = heights[node.right] if node.right is not None else 0
            best = max(best, left + right)
            heights[node] = 1 + max(left, right)
    return best
