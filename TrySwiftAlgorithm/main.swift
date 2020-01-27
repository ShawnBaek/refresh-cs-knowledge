//
//  main.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/5/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

func runSlidingWindowPatterns() {
    findAverageOfSubArray(k: 5, arr: [1, 3, 2, 6, -1, 4, 1, 8, 2])
    maxSubArrayOfSizeK(k: 3, arr: [2, 1, 5, 1, 3, 2])
    smallestSubArrayWithGivenSum(s: 7, arr: [2, 1, 5, 2, 3, 2])
    smallestSubArrayWithGivenSum(s: 7, arr: [2, 1, 5, 1, 8])
    longestSubStringWithKDistinct(str: "araaci", k: 2) // 4
    longestSubStringWithKDistinct(str: "araaci", k: 1) // 2
    longestSubStringWithKDistinct(str: "cbbebi", k: 3) // 5
}


//let input = "agoda best apps"
//let temp = input.split(separator: " ").reversed().joined(separator: " ")
//
//print(temp)
//
////runSlidingWindowPatterns()
//
//let dateString = "Mar 01"
//let formatter = DateFormatter()
//formatter.dateFormat = "MMM dd"
//let date = formatter.date(from: dateString)
////var t =
//print(date)


public func solution(_ message : inout String, _ K : Int) -> String {
//    message.count
    guard K >= 1, K <= 500 else {
        return ""
    }
    let endIndex = message.index(message.startIndex, offsetBy: K)
//    let croppedMessage = String(message[message.startIndex...endIndex])

    let croppedMessage = message.prefix(K)
    var words = croppedMessage.split(separator: " ")

    let originWords = message.split(separator: " ")

    var removeIndex: Int?
    for (index, word) in words.enumerated() {
        if word != originWords[index] {
            removeIndex = index
            break
        }
    }
    if let removeWordIndex = removeIndex {
        words.remove(at: removeWordIndex)
    }
    let finalResult = words.joined(separator: " ")
    return finalResult
}
//var text = "Codility We test coders"
//let result = solution(&text, 14)
//
//print(result)



public func solution(_ S : inout String) -> Int {
    // write your code in Swift 4.2.1 (Linux)


    let calls = S.split(separator: "\n")
    for (index, call) in calls.enumerated() {
        print("call -> \(call)")

        let callingTime = String(call.split(separator: ",").first ?? "")
        let result = getTotalDuration(time: callingTime)
        print("total: \(result.total) min: \(result.min)")
    }
    return 0
}

public func getTotalDuration(time: String) -> (total: Int, min: Int) {
    let timeComponents = time.split(separator: ":")
    let hours = (Int(String(timeComponents[0])) ?? 0) * 3600
    let min = (Int(String(timeComponents[1])) ?? 0) * 60
    let sec = (Int(String(timeComponents[2])) ?? 0)
    return (total: hours + min + sec, min: (Int(String(timeComponents[1])) ?? 0))
}

var text = """
00:01:07,400-234-090
00:05:01,701-080-080
00:05:00,400-234-090
"""

solution(&text)
