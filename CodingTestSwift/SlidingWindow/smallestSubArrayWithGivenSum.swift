//
//  smallestSubArrayWithGivenSum.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/6/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

func smallestSubArrayWithGivenSum(s: Int, arr: [Int]) -> Int {
    //There is no fixed length
    var start = 0
    var minLength = Int.max
    var sum = 0
    for end in stride(from: 0, to: arr.count, by: 1) {
        sum += arr[end]
        while sum >= s {
            minLength = min(minLength, end - start + 1)
            sum -= arr[start]
            start += 1
        }
    }
    print("smallestSubArrayWithGivenSum : \(minLength)")
    if minLength == Int.max {
        return 0
    }
    return minLength
}
