# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def good_nodes(root: TreeNode | None) -> int:
    if root is None:
        return 0
    count = 0
    stack = [(root, root.val)]
    while stack:
        node, max_so_far = stack.pop()
        if node.val >= max_so_far:
            count += 1
        new_max = max(max_so_far, node.val)
        if node.right is not None:
            stack.append((node.right, new_max))
        if node.left is not None:
            stack.append((node.left, new_max))
    return count
