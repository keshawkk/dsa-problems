class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        guard !matrix[0].isEmpty else { return false }

        var r = matrix.count - 1
        var c = 0

        while r >= 0 && c < matrix[0].count {
            let num = matrix[r][c]
            if num == target {
                return true
            } else if num < target {
                c += 1
            } else {
            r -= 1
            }
        }

        return false
    }

}
