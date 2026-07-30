
class Node {
  let key: Int
  var value: Int
  var prev: Node?
  var next: Node?

  init(_ val: Int, _ key: Int) {
    self.value = val
    self.key = key
  }
}

class LRUCache {
  private let capacity: Int

  private var map = [Int: Node]()

  private let LRU: Node
  private let MRU: Node

  init(_ capacity: Int) {
    self.capacity = capacity
    self.LRU = Node(0, 0)
    self.MRU = Node(0, 0)

    MRU.next = LRU
    LRU.prev = MRU
  }

  func get(_ key: Int) -> Int {
    guard let node = map[key] else { return -1 }

    detach(node)
    moveToHead(node)

    return node.value
  }

  func put(_ key: Int, _ value: Int) {
    if let node = map[key] {
      node.value = value
      detach(node)
      moveToHead(node)
      return
    }

    if map.count == capacity {
      evict()
    }

    let node = Node(value, key)
    map[key] = node
    moveToHead(node)
  }

  private func detach(_ node: Node) {
    node.prev?.next = node.next
    node.next?.prev = node.prev

    node.prev = nil
    node.next = nil
  }

  private func moveToHead(_ node: Node) {
    node.next = MRU.next
    node.prev = MRU

    node.next?.prev = node

    MRU.next = node
  }

  private func evict() {
    guard let node = LRU.prev, node !== MRU else { return }

    detach(node)
    map[node.key] = nil
  }
}
