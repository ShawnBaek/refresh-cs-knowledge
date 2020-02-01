//
//  SlidingWindowProblem1.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/6/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

enum SlidingWindow {
    case average(using: SolvingProblem)
    case maximum
    case minimum
}

extension SlidingWindow {
    func getMethod() -> String {
        switch self {
        case let .average(using: solvingProblem):
            print("")
            return "average: \(solvingProblem) approach"
        case .maximum:
            return "maximum"
        case .minimum:
            return "minimum"
        }
    }
}

func findAverageOfSubArrayBruteForce(input: [Int], k: Int, method: SlidingWindow) -> [Double] {
    var result = [Double]()
    var windowSum = 0.0
    var windowStart = 0
    for windowEnd in stride(from: 0, to: input.count, by: 1) {
        windowSum += Double(input[windowEnd])
        if windowEnd >= k-1 {
            let average = windowSum / Double(k)
            result.insert(average, at: result.endIndex)
            //subtract
            windowSum -= Double(input[windowStart])
            windowStart += 1
        }
    }
    return result
}

func findAverageOfSubArrayOptimazation(input: [Int], k: Int, method: SlidingWindow) -> [Double] {
    var windowStartIndex = 0
    var result: [Double] = []
    var windowSum = 0
    for i in stride(from: 0, to: input.count, by: 1) {
        windowSum += input[i]
        if i >= k - 1 {
            result.append(Double(windowSum) / Double(k))
            windowSum -= input[windowStartIndex]
            windowStartIndex += 1
        }
    }
    return result
}


func findMaximumOfSubArray(input: [Int], k: Int) -> Double {
    var windowStartIndex = 0
    var windowSum = 0
    var maxSum = 0
    for i in stride(from: 0, to: input.count, by: 1) {
        windowSum += input[i]
        if i >= k - 1 {
            maxSum = max(maxSum, windowSum)
            windowSum -= input[windowStartIndex]
            windowStartIndex += 1
        }
    }
    return Double(maxSum)
}


func runSlidingWindow(method: SlidingWindow, input: [Int], k: Int) {
    var result: [Double] = []
    switch method {
    case let .average(solvingProblem):
        if solvingProblem == .bruteForce {
            result = findAverageOfSubArrayBruteForce(input: input, k: k, method: .average(using: solvingProblem))
        }
        else {
            result = findAverageOfSubArrayOptimazation(input: input, k: k, method: .average(using: solvingProblem))
        }
    case .maximum:
        result.append(findMaximumOfSubArray(input: input, k: k))
    case .minimum:
        print("")
    }
    let resultInformation =
    #"""
    --- Function ---
    🏀 \#(#function) to get \#(method.getMethod())
    --- Input ---
    👉 Input: \#(input)
    👉 Size K: \#(k)
    --- Output ---
    🔥 Result: \#(result)
    """#
    print(resultInformation)
}
