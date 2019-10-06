//
//  SlidingWindowProblem1.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/6/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

//func findAverageOfSubArray(k: Int, arr: [Double]) -> [Double] {
//    var result = [Double]()
//    //to means less than!
//    for i in stride(from: 0, to: arr.count + 1 - k, by: 1) {
//        var sum = 0.0
//        for size in stride(from: i, to: i + k, by: 1) {
//            sum += arr[size]
//        }
//        let average = sum / Double(k)
//        result.insert(average, at: result.endIndex)
//    }
//    return result
//}

func findAverageOfSubArray(k: Int, arr: [Double]) -> [Double] {
    var result = [Double]()
    var windowSum = 0.0
    var windowStart = 0
    
    //to means less than!
    for windowEnd in stride(from: 0, to: arr.count, by: 1) {
        windowSum += arr[windowEnd]
        if windowEnd >= k-1 {
            let average = windowSum / Double(k)
            result.insert(average, at: result.endIndex)
            //subtract
            windowSum -= arr[windowStart]
            windowStart += 1
        }
    }
    print("findAverageOfSubArray: \(result)")
    return result
}
