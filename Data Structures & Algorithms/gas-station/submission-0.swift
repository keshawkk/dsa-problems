class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        guard gas.count == cost.count, !gas.isEmpty else { return -1 }

        var totalDelta = 0
        var currGas = 0
        var startCandidate = 0

        for i in 0..<gas.count {
            let delta = gas[i] - cost[i]
            currGas += delta
            totalDelta += delta

            if currGas < 0 {
                currGas = 0
                startCandidate = i + 1
            }
        }

        return totalDelta >= 0 ? startCandidate : -1
    }
}
