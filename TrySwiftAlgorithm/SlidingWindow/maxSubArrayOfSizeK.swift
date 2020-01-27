//
//  maxSubArrayOfSizeK.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/6/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation
import AppKit

@discardableResult func maxSubArrayOfSizeK(k: Int, arr: [Double]) -> Double {
    var maxSum = 0.0
    var start = 0
    var sum = 0.0
    for end in stride(from: 0, to: arr.count, by: 1) {
        sum += arr[end]
        if end >= k-1 {
            maxSum = max(sum, maxSum)
            sum -= arr[start]
            start+=1
        }
    }
    print("maxSum is \(maxSum)")
    return maxSum
}
