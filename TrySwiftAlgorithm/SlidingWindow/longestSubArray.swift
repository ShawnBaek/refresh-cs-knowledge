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

/*
 Problem Statement
 Given an array of characters where each character represents a fruit tree, you are given two baskets and your goal is to put maximum number of fruits in each basket. The only restriction is that each basket can have only one type of fruit.

 You can start with any tree, but once you have started you can’t skip a tree. You will pick one fruit from each tree until you cannot, i.e., you will stop when you have to pick from a third fruit type.

 Write a function to return the maximum number of fruits in both the baskets. by Educative.io
 */

func fruitIntoBasket(input: [String]) -> Int {
    //fruit into two baskets
    var windowStart = 0
    var dict: [String: Int] = [:]
    let numberOfBasket = 2
    var maximumNumberOfFruits = 0
    for windowEnd in stride(from: 0, to: input.count, by: 1) {
        if dict[input[windowEnd]] == nil {
            dict[input[windowEnd]] = 0
        }
        dict[input[windowEnd]]! += 1
        while dict.keys.count > numberOfBasket {
            dict[input[windowStart]]! -= 1
            if dict[input[windowStart]] == 0 {
                dict.removeValue(forKey: input[windowStart])
            }
            //shrink the window
            windowStart += 1
        }
        //reduce is super slower than for loop
        var sumOfValue = 0
        for i in dict.values {
            sumOfValue += i
        }
        maximumNumberOfFruits = max(maximumNumberOfFruits, sumOfValue)
    }
    print("output: \(maximumNumberOfFruits)")
    return maximumNumberOfFruits
}

func longestSubStringNoRepeatingCharacterUsingCounter(input: String) -> Int {
    var windowStart = 0
    var frequencyMap: [String: Int] = [:]
    var longestSubarray = 0
    
    for (windowEnd, character) in input.enumerated() {
        if frequencyMap[character.description] == nil {
            frequencyMap[character.description] = 0
        }
        frequencyMap[character.description]! += 1
        if frequencyMap[character.description]! > 1 {
            frequencyMap[character.description]! -= 1
            if frequencyMap[character.description]! == 0 {
                frequencyMap.removeValue(forKey: character.description)
            }
            //shrink window -> update windowStart
            windowStart = windowEnd
        }
        longestSubarray = max(longestSubarray, windowEnd - windowStart + 1)
    }
    print("longest Subarray Using Counter: \(longestSubarray)")
    return 0
}

func longestSubStringNoRepeatingCharacterUsingIndex(input: String) -> Int {
    var windowStart = 0
    var frequencyMap: [String: Int] = [:]
    var longestSubarray = 0
    for (windowEnd, character) in input.enumerated() {
        if frequencyMap[character.description] != nil {
            windowStart = max(windowStart, frequencyMap[character.description]! + 1)
        }
        frequencyMap[character.description] = windowEnd
        //update longest subarray
        longestSubarray = max(longestSubarray, windowEnd - windowStart + 1)
    }
    print("longest Subarray using Index: \(longestSubarray)")
    return 0
}

//Input: aabccbb -> c with b -> bbbbb
func longestSubStringWithSameLetterAfterReplace(input: String, k: Int) -> Int {
    var windowStart = 0
    var maxRepeatLetterCount = 0
    var maxLength = 0
    var frequencyMap: [String: Int] = [:]
    for (windowEnd, character) in input.enumerated() {
        if frequencyMap[character.description] == nil {
            frequencyMap[character.description] = 0
        }
        frequencyMap[character.description]! += 1
        maxRepeatLetterCount = max(maxRepeatLetterCount, frequencyMap[character.description]!)
        if (windowEnd - windowStart + 1 - maxRepeatLetterCount) > k {
            let windowStartIndex = input.index(input.startIndex, offsetBy: windowStart)
            frequencyMap[input[windowStartIndex].description]! -= 1
            windowStart += 1
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    return maxLength
}

func longestSubStringWithOneAfterReplace(input: [Int], k: Int) -> Int {
    var windowStart = 0
    var maxLength = 0
    var frequencyMap: [Int: Int] = [:]
    
    for windowEnd in stride(from: 0, to: input.count, by: 1) {
        let digit = input[windowEnd]
        if frequencyMap[digit] == nil {
            frequencyMap[digit] = 0
        }
        frequencyMap[digit]! += 1
        while (frequencyMap[0]! > k) {
            let startDigit = input[windowStart]
            frequencyMap[startDigit]! -= 1
            if frequencyMap[startDigit] == 0 {
                frequencyMap.removeValue(forKey: startDigit)
            }
            windowStart += 1
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    print("Longest SubString 1's is \(maxLength)")
    return maxLength
}

func longestSubStringWithOneAfterReplaceOptimization(input: [Int], k: Int) -> Int {
    var windowStart = 0
    var maxLength = 0
    var maxOneCounts = 0
    
    for windowEnd in stride(from: 0, to: input.count, by: 1) {
        let digit = input[windowEnd]
        if digit == 1 {
            maxOneCounts += 1
        }
        
        //check 0's count > k
        if windowEnd - windowStart + 1 - maxOneCounts > k {
            //shrink the window
            if input[windowStart] == 1 {
                maxOneCounts -= 1
            }
            windowStart += 1
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    print("longestSubStringWithOneAfterReplaceOptimization 1's is \(maxLength)")
    return maxLength
}
