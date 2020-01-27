//
//  longestSubStringWithKDistinct.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/6/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation
@discardableResult func longestSubStringWithKDistinct(str: String, k: Int) -> Int {
    var temp = ""
    var longestLength = 0
    var start = 0
    
    for (end, c) in str.enumerated() {
        temp.append(c)
        let tempCount = Set(temp).count
        if tempCount == k {
            longestLength = max(longestLength, end - start + 1)
        } else if (tempCount > k) {
            //Remove first character in array
            temp.remove(at: temp.index(temp.startIndex, offsetBy: 0))
            start += 1
        }
    }
    print("longestLength: \(longestLength) str: \(str) k: \(k) ")
    return longestLength
}
