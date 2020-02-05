//
//  main.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/5/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

enum SolvingProblem: String {
    case bruteForce
    case optimization
}

enum DynamicProgramming: String {
    case memoization
    case tabulation
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0
    print("Time: \(timeElapsed)ms\n")
}

printTimeElapsedWhenRunningCode {
    run01Knapsack(method: .tabulation, profits: [1, 6, 10, 16], weights: [1, 2, 3, 5], capacity: 7)
}

func runSlidingWindowPatterns() {
    printTimeElapsedWhenRunningCode {
        runSlidingWindow(method: .average(using: .bruteForce), input: [1, 3, 2, 6, -1, 4, 1, 8, 2], k: 5, expect: [2.0])
    }

    printTimeElapsedWhenRunningCode {
        runSlidingWindow(method: .average(using: .optimization), input: [1, 3, 2, 6, -1, 4, 1, 8, 2], k: 5)
    }

    printTimeElapsedWhenRunningCode {
        runSlidingWindow(method: .maximum, input: [2, 1, 5, 1, 3, 2], k: 3)
    }

    printTimeElapsedWhenRunningCode {
        runSlidingWindow(method: .minimum, input: [2, 1, 5, 1, 3, 2], given: 3)
    }
}
runSlidingWindowPatterns()


printTimeElapsedWhenRunningCode {
    longestCharacter(input: "araaci", distinct: 2, expect: 4)
}

printTimeElapsedWhenRunningCode {
    longestCharacter(input: "araaci", distinct: 1, expect: 2)
}

printTimeElapsedWhenRunningCode {
    longestCharacter(input: "cbbebi", distinct: 3, expect: 5)
}

printTimeElapsedWhenRunningCode {
    fruitIntoBasket(input: ["a", "b", "c", "a", "c"])
}

printTimeElapsedWhenRunningCode {
    longestSubStringNoRepeatingCharacterUsingCounter(input: "abccde")
    longestSubStringNoRepeatingCharacterUsingCounter(input: "abbbb")
    longestSubStringNoRepeatingCharacterUsingCounter(input: "abccde")
    
}

printTimeElapsedWhenRunningCode {
    longestSubStringNoRepeatingCharacterUsingIndex(input: "abccde")
    longestSubStringNoRepeatingCharacterUsingIndex(input: "abbbb")
    longestSubStringNoRepeatingCharacterUsingIndex(input: "abccde")
    
}

printTimeElapsedWhenRunningCode {
    longestSubStringWithSameLetterAfterReplace(input: "aabccbb", k: 2)
}


