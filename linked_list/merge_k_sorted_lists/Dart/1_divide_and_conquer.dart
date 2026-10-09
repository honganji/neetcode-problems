// LeetCode provides this definition.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? mergeKLists(List<ListNode?> lists) {
  ListNode? mergeTwo(ListNode? a, ListNode? b) {
    final dummy = ListNode();
    var tail = dummy;
    while (a != null && b != null) {
      if (a.val <= b.val) {
        tail.next = a;
        a = a.next;
      } else {
        tail.next = b;
        b = b.next;
      }
      tail = tail.next!;
    }
    tail.next = a ?? b;
    return dummy.next;
  }

  if (lists.isEmpty) return null;
  var current = lists;
  while (current.length > 1) {
    final merged = <ListNode?>[];
    for (var i = 0; i < current.length; i += 2) {
      final a = current[i];
      final b = i + 1 < current.length ? current[i + 1] : null;
      merged.add(mergeTwo(a, b));
    }
    current = merged;
  }
  return current[0];
}
