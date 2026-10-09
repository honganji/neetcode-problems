# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def level_order(root: TreeNode | None) -> list[list[int]]:
    result: list[list[int]] = []
    if root is None:
        return result
    stack = [(root, 0)]
    while stack:
        node, depth = stack.pop()
        if depth == len(result):
            result.append([])
        result[depth].append(node.val)
        if node.right:
            stack.append((node.right, depth + 1))
        if node.left:
            stack.append((node.left, depth + 1))
    return result
