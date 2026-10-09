# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def kth_smallest(root: TreeNode | None, k: int) -> int:
    count = 0
    result = -1

    def inorder(node: TreeNode | None) -> None:
        nonlocal count, result
        if node is None or result != -1:
            return
        inorder(node.left)
        if result != -1:
            return
        count += 1
        if count == k:
            result = node.val
            return
        inorder(node.right)

    inorder(root)
    return result
