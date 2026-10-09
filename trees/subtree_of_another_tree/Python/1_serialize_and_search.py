# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def is_subtree(root: TreeNode | None, sub_root: TreeNode | None) -> bool:
    def serialize(node: TreeNode | None) -> str:
        parts = []

        def walk(current: TreeNode | None) -> None:
            if current is None:
                parts.append(",N")
                return
            parts.append(f",#{current.val}")
            walk(current.left)
            walk(current.right)

        walk(node)
        return "".join(parts)

    def kmp_contains(text: str, pattern: str) -> bool:
        failure = [0] * len(pattern)
        k = 0
        for i in range(1, len(pattern)):
            while k > 0 and pattern[i] != pattern[k]:
                k = failure[k - 1]
            if pattern[i] == pattern[k]:
                k += 1
            failure[i] = k
        k = 0
        for ch in text:
            while k > 0 and ch != pattern[k]:
                k = failure[k - 1]
            if ch == pattern[k]:
                k += 1
            if k == len(pattern):
                return True
        return False

    return kmp_contains(serialize(root), serialize(sub_root))
