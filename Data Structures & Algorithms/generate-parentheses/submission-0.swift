class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var allComb = [String]()
        var curr = [Character]()

        func generate(_ open: Int, _ close: Int) {
            if open == 0 && close == 0 {
                allComb.append(String(curr))
                return
            }

            if open == close {
                curr.append("(")
                generate(open - 1, close)
                curr.removeLast()
            } else {
                if open > 0 {
                    curr.append("(")
                    generate(open - 1, close)
                    curr.removeLast()
                }

                curr.append(")")
                generate(open, close - 1)
                curr.removeLast()
            }
        }

        generate(n, n)

        return allComb
    }
}
