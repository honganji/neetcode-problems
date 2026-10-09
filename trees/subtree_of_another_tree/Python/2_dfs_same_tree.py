# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_subtree(root: TreeNode | None, sub_root: TreeNode | None) -> bool:
    def is_same_tree(a: TreeNode | None, b: TreeNode | None) -> bool:
        if a is None or b is None:
            return a is b
        return (
            a.val == b.val
            and is_same_tree(a.left, b.left)
            and is_same_tree(a.right, b.right)
        )

    if sub_root is None:
        return True
    if root is None:
        return False
    if is_same_tree(root, sub_root):
        return True
    return is_subtree(root.left, sub_root) or is_subtree(root.right, sub_root)
