# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def diameter_of_binary_tree(root: TreeNode | None) -> int:
    def height(node: TreeNode | None) -> int:
        if node is None:
            return 0
        return 1 + max(height(node.left), height(node.right))

    if root is None:
        return 0
    through_root = height(root.left) + height(root.right)
    return max(
        through_root,
        diameter_of_binary_tree(root.left),
        diameter_of_binary_tree(root.right),
    )
