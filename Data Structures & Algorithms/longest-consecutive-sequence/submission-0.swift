class Solution {
   func longestConsecutive(_ nums: [Int]) -> Int {
  guard !nums.isEmpty else { return 0 }

  var set = Set(nums)
  var maxCons = 0

  for num in nums {

    if set.contains(num - 1) { continue }

    var n = num
    var counter = 0
    while set.contains(n) {
      set.remove(n)
      n += 1
      counter += 1
    }

    maxCons = max(maxCons, counter)
  }

  return maxCons
}
}
