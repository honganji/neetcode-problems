# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def good_nodes(root: TreeNode | None) -> int:
    def dfs(node: TreeNode | None, max_so_far: int) -> int:
        if node is None:
            return 0
        count = 1 if node.val >= max_so_far else 0
        new_max = max(max_so_far, node.val)
        return count + dfs(node.left, new_max) + dfs(node.right, new_max)

    if root is None:
        return 0
    return dfs(root, root.val)
