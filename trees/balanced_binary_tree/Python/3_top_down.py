# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_balanced(root: TreeNode | None) -> bool:
    def height(node: TreeNode | None) -> int:
        if node is None:
            return 0
        return 1 + max(height(node.left), height(node.right))

    if root is None:
        return True
    if abs(height(root.left) - height(root.right)) > 1:
        return False
    return is_balanced(root.left) and is_balanced(root.right)
