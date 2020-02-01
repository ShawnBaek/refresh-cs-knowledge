//
//  01Knapsack.swift
//  CodingInterview
//
//  Created by BaekSungwook on 1/17/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

func knapsack01Memoization(profits: [Int], weights: [Int], capacity: Int) -> Int {
    //Time Complexity: O(N*C)
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: capacity + 1), count: profits.count)
    func recursiveKanpsack(profits: [Int], weights: [Int], capacity: Int, index: Int) -> Int {
        //base case
        if (capacity <= 0) || (index >= profits.count) {
            return 0
        }

        if dp[index][capacity] != -1 {
            return dp[index][capacity]
        }
        //take index item
        var takeIndexItem = 0
        if weights[index] <= capacity {
            //select firstItemProfit, check next item
            takeIndexItem = profits[index] + recursiveKanpsack(profits: profits, weights: weights, capacity: capacity - weights[index], index: index + 1)
        }
        //not take index item
        let notTakeIndexItem = recursiveKanpsack(profits: profits, weights: weights, capacity: capacity, index: index + 1)
        let maxProfit = max(takeIndexItem, notTakeIndexItem)
        dp[index][capacity] = maxProfit
        return dp[index][capacity]
    }
    //start with index 0
    return recursiveKanpsack(profits: profits, weights: weights, capacity: capacity, index: 0)
}

func knapsack01Tabulation(profits: [Int], weights: [Int], capacity: Int) -> Int {
    //Base Case
    if capacity <= 0 || profits.count == 0 || profits.count != weights.count {
        return 0
    }

    //Initilize
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: capacity + 1), count: profits.count)
    for c in stride(from: 1, to: capacity + 1, by: 1) {
        if weights[0] <= c {
            dp[0][c] = profits[0]
        }
    }

    for i in stride(from: 1, to: profits.count, by: 1) {
        for c in stride(from: 1, to: capacity + 1, by: 1) {
            //not taken index item
            let notTakeIndexItem = dp[i-1][c]
            var takeIndexItem = 0
            if weights[i] <= c {
                takeIndexItem = profits[i] + dp[i-1][c - weights[i]]
            }
            dp[i][c] = max(notTakeIndexItem, takeIndexItem)
        }
    }

    //Find the selected item's weight
//    var totalProfit = dp[profits.count-1][capacity]
//    var remainCapacity = capacity
//    var selectedItem = [Int]()
//    for i in stride(from: profits.count-1, to: 0, by: -1) {
//        //i item is selected
//        if dp[i-1][remainCapacity] != totalProfit {
//            selectedItem.append(weights[i])
//            //substract totalProfit and remainCapacity
//            totalProfit -= profits[i]
//            remainCapacity -= weights[i]
//        }
//    }
//    if totalProfit != 0 {
//        selectedItem.append(weights[0])
//    }
//    print("selected item: \(selectedItem)")
    return dp[profits.count-1][capacity]
}

func run01Knapsack(method: DynamicProgramming, profits: [Int], weights: [Int], capacity: Int) {
    var result = 0
    switch method {
    case .memoization:
        result = knapsack01Memoization(profits: profits, weights: weights, capacity: capacity)
    case .tabulation:
        result = knapsack01Tabulation(profits: profits, weights: weights, capacity: capacity)
    }
    let resultInformation =
    #"""
    --- Function ---
    🏀 \#(#function) using \#(method.rawValue)
    --- Input ---
    👉 Profits: \#(profits)
    👉 Weight: \#(weights)
    👉 Capacity: \#(capacity)
    --- Output ---
    🔥 Result: \#(result)
    """#
    print(resultInformation)
}
