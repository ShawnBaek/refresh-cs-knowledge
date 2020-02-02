//
//  longestSubArray.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/3/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

func longestCharacter(input: String, distinct: Int, expect: Int) {
    var longestString: [String] = []
    var dict: [String: Int] = [:]
    var maxLength = 0
    var windowStart = 0
    for (windowEnd, character) in input.enumerated() {
        longestString.append(character.description)
        if !dict.keys.contains(character.description) {
            dict[character.description] = 0
        }
        dict[character.description]! += 1
        //Shrink the window
        while dict.keys.count > distinct {
            //Do not remove an item in longestString
            let shrinkCharacter = longestString[windowStart]
            dict[shrinkCharacter]! -= 1
            if dict[shrinkCharacter] == 0 {
                dict.removeValue(forKey: shrinkCharacter)
            }
            windowStart += 1
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    
    let resultInformation =
    #"""
    --- Function ---
    |🏀 \#(#function)
    |
    --- Input ------
    |👉 Input: \#(input)
    |👉 Distinct Size: \#(distinct)"
    |
    --- Output -----
    |🔥 Result: \#(maxLength)
    """#
    let testResult =
    #"""
    |
    --- Test -------
    \#(expect == maxLength ?
    "|😁 Success: Expected Result: \(expect), Result: \(maxLength)" :
    "|😭 Failed: Expected Result: \(expect), Result: \(maxLength)")
    ----------------
    """#
    print("\(resultInformation)\n\(testResult)")
}
