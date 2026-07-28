class Solution {
  func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    guard s1.count + s2.count == s3.count else { return false }

    let s1 = Array(s1)
    let s2 = Array(s2)
    let s3 = Array(s3)

    let lenS1 = s1.count
    let lenS2 = s2.count

    // dp[i][j] = can first i of s1 + first j of s2 make first (i+j) of s3?
    var dp = Array(repeating: Array(repeating: false, count: lenS2 + 1), count: lenS1 + 1)
    dp[0][0] = true

    for r in 1..<(lenS1 + 1) {
      dp[r][0] = dp[r - 1][0] && s1[r - 1] == s3[r - 1]
    }

    for c in 1..<(lenS2 + 1) {
      dp[0][c] = dp[0][c - 1] && s2[c - 1] == s3[c - 1]
    }

    for r in 1..<(lenS1 + 1) {
      for c in 1..<(lenS2 + 1) {
      dp[r][c] = (dp[r][c - 1] && s2[c - 1] == s3[r + c - 1]) 
                  || 
                  (dp[r - 1][c] && s1[r - 1] == s3[r + c - 1])
      }
    }

    return dp[lenS1][lenS2]
  }

}
