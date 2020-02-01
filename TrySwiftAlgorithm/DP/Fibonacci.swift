//
//  main.swift
//  CodingInterview
//
//  Created by BaekSungwook on 1/15/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

//Memoization: Top down approach
var memoization: [Int: Int] = [0:0, 1:1]
func fibonacciMemoization(n: Int) -> Int {
    if n < 2 {
        return n
    }
    if let value = memoization[n], value != 0 {
        return value
    }
    let result = fibonacciMemoization(n: n - 1) + fibonacciMemoization(n: n - 2)
    memoization[n] = result
    return result
}


func fibonacciTabulation(n: Int) -> Int {
    var dp: [Int: Int] = [0: 0, 1: 1]
    for i in stride(from: 2, through: n, by: 1) {
        let firstValue = dp[i-1] ?? 0
        let secondValue = dp[i-2] ?? 0
        let result = firstValue + secondValue
        dp[i] = result
    }
    return dp[n] ?? 0
}

func runFibonacci(method: DynamicProgramming, input: Int) {
    var result = 0
    switch method {
    case .memoization:
        result = fibonacciMemoization(n: input)
    case .tabulation:
        result = fibonacciTabulation(n: input)
    }
    print("Fibonacci with \(method.rawValue)\n👉 Input: \(input) 🔥 Result: \(result)")
}
