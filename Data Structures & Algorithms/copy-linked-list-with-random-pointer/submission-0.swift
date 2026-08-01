/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

extension Node: Hashable {
  public static func ==(lhs: Node, rhs: Node) -> Bool {
    lhs === rhs
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self))
  }
}

class Solution {

    func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }

    var newHead = Node(head.val)
    var node: Node? = head.next
    var curr: Node? = newHead

    var dict: [Node: Node] = [head: newHead]

    while let n = node {
        let temp = Node(n.val)
        dict[n] = temp

        curr?.next = temp

        curr = curr?.next
        node = node?.next
    }

    curr = newHead
    node = head

    while let original = node, let copy = curr {
        if let random = original.random {
        copy.random = dict[random]
        }

        curr = curr?.next
        node = node?.next
    }

    return newHead
    }

}
