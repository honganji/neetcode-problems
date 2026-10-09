# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_subtree(root: TreeNode | None, sub_root: TreeNode | None) -> bool:
    def build_keys(node: TreeNode | None, keys: dict) -> str:
        if node is None:
            return "N"
        left_key = build_keys(node.left, keys)
        right_key = build_keys(node.right, keys)
        key = f"(#{node.val}{left_key}{right_key})"
        keys[node] = key
        return key

    target = build_keys(sub_root, {})
    if sub_root is None:
        return True
    root_keys: dict = {}
    build_keys(root, root_keys)
    return any(key == target for key in root_keys.values())
