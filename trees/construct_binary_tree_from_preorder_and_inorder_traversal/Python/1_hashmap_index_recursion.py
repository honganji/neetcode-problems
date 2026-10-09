# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    index_of = {val: i for i, val in enumerate(inorder)}
    pre_pos = 0

    def build(lo: int, hi: int) -> TreeNode | None:
        nonlocal pre_pos
        if lo > hi:
            return None
        val = preorder[pre_pos]
        pre_pos += 1
        node = TreeNode(val)
        mid = index_of[val]
        node.left = build(lo, mid - 1)
        node.right = build(mid + 1, hi)
        return node

    return build(0, len(inorder) - 1)
