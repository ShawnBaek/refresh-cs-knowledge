//
//  Subsets.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/25/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation


func findSubsets(input: [Int]) -> [[Int]] {
    var subsets: [[Int]] = [[Int]]()
    subsets.append([])
    for i in stride(from: 0, to: input.count, by: 1) {
        let currentNumber = input[i]
        let count = subsets.count
        for j in 0..<count {
            //copy subset and add current numbers
            var set: [Int] = subsets[j]
            set.append(currentNumber)
            subsets.append(set)
        }
    }
    return subsets
}


func findSubsetsRemoveDuplicates(input: [Int]) -> [[Int]] {
    var subsets: [[Int]] = [[Int]]()
    let sortedInput = input.sorted { $0 < $1 }
    subsets.append([])
    var startIndex = 0
    var endIndex = 0
    for i in stride(from: 0, to: sortedInput.count, by: 1) {
        startIndex = 0
        let currentNumber = sortedInput[i]
        if i > 0, sortedInput[i - 1] == sortedInput[i] {
            startIndex = endIndex + 1
        }
        endIndex = subsets.count - 1
        for j in startIndex...endIndex {
            //copy subset and add current numbers
            var set: [Int] = subsets[j]
            set.append(currentNumber)
            subsets.append(set)
        }
    }
    return subsets
}

func permutations(input: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var permutation = [[Int]]()
    permutation.append([])
    for currentNumber in input {
        let count = permutation.count
        for _ in 0..<count {
            let oldPermutation = permutation.removeFirst()
            for j in 0..<oldPermutation.count + 1 {
                var newPermutation = oldPermutation
                newPermutation.insert(currentNumber, at: j)
                if newPermutation.count == input.count {
                    result.append(newPermutation)
                }
                else {
                    permutation.append(newPermutation)
                }
            }
        }
    }
    return result
}
