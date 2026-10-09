# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def max_path_sum(root: TreeNode | None) -> int:
    def best_downward(node: TreeNode | None) -> int:
        if node is None:
            return 0
        return node.val + max(best_downward(node.left), best_downward(node.right), 0)

    def visit(node: TreeNode | None) -> int:
        if node is None:
            return float("-inf")
        left = max(best_downward(node.left), 0)
        right = max(best_downward(node.right), 0)
        through = node.val + left + right
        return max(through, visit(node.left), visit(node.right))

    return int(visit(root))
