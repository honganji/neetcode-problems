# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


class Codec:
    def serialize(self, root: TreeNode | None) -> str:
        tokens: list[str] = []

        def dfs(node: TreeNode | None) -> None:
            if node is None:
                tokens.append("N")
                return
            dfs(node.left)
            dfs(node.right)
            tokens.append(str(node.val))

        dfs(root)
        return ",".join(tokens)

    def deserialize(self, data: str) -> TreeNode | None:
        tokens = data.split(",")

        def build() -> TreeNode | None:
            token = tokens.pop()
            if token == "N":
                return None
            node = TreeNode(int(token))
            node.right = build()
            node.left = build()
            return node

        return build()
