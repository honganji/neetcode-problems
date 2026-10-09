# LeetCode provides this definition.
class TreeNode:
    def __init__(self, val: int = 0, left: "TreeNode | None" = None, right: "TreeNode | None" = None):
        self.val = val
        self.left = left
        self.right = right


def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
    if not preorder:
        return None
    root = TreeNode(preorder[0])
    stack = [root]
    in_pos = 0
    for val in preorder[1:]:
        node = TreeNode(val)
        if stack[-1].val != inorder[in_pos]:
            stack[-1].left = node
        else:
            parent = stack[-1]
            while stack and stack[-1].val == inorder[in_pos]:
                parent = stack.pop()
                in_pos += 1
            parent.right = node
        stack.append(node)
    return root
