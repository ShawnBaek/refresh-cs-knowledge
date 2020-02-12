//
//  TwoPointers.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/10/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

//Time Complexity: O(N)
func pairWithTargetSum(input: [Int], target: Int) -> [Int] {
    var output: [Int] = [Int]()
    var end = input.count - 1
    var start = 0
    while start < end {
        let sum = input[start] + input[end]
        if sum > target {
            end -= 1
            continue
        }
        else if sum < target {
            start += 1
            continue
        }
        else if sum == target {
            output = [start, end]
            break
        }
    }
    
    print("Pair with Target Sum: \(output)")
    return output
}

func pairWithTargetSumUsingHashTable(input: [Int], target: Int) -> [Int] {
    var output: [Int] = [Int]()
    var hashTable: [Int: Int] = [:]
    for i in stride(from: 0, to: input.count, by: 1) {
        let item = target - input[i]
        if hashTable.keys.contains(item) {
            output = [hashTable[item]!, i]
            break
        }
        else {
            hashTable[input[i]] = i
        }
    }
    print("Pair with Target Sum using Hash: \(output)")
    return output
}

func removeDuplicateSortedArray(input: [Int]) -> Int {
    var length = 0
    for left in stride(from: 0, to: input.count - 1, by: 1) {
        let right = left + 1
        if left == 0 {
            length += 1
        }
        if input[left] == input[right] {
            continue
        } else {
            length += 1
        }
    }
    print("length is \(length)")
    return 0
}

func removeDuplicateSortedArray2(input: [Int]) -> Int {
    var nextNonDuplicateIndex = 1
    var output = input
    var i = 1
    while (i < output.count) {
        if output[nextNonDuplicateIndex - 1] != output[i] {
            output[nextNonDuplicateIndex] = output[i]
            nextNonDuplicateIndex += 1
        }
        i += 1
    }
    return 0
}

func removeDuplicateSortedArrayGivenKey(input: [Int], key: Int) -> Int {
    var nextElement = 0
    var output = input
    for i in stride(from: 0, to: output.count, by: 1) {
        if input[i] != key {
            output[nextElement] = output[i]
            nextElement += 1
        }
    }
    print("removeDuplicated Sorted Array given key: \(nextElement)")
    return nextElement
}

func makeSquares(input: [Int]) -> [Int] {
    var output: [Int] = Array(repeating: 0, count: input.count)
    
    var leftIndex = 0
    var highestIndex = input.count - 1
    var rightIndex = input.count - 1
    
    //[-2, -1, 0, 2, 3]
    while leftIndex <= rightIndex {
        let leftItem = input[leftIndex] * input[leftIndex]
        let rightItem = input[rightIndex] * input[rightIndex]
        if leftItem > rightItem {
            output[highestIndex] = leftItem
            leftIndex += 1
        }
        else {
            output[highestIndex] = rightItem
            rightIndex -= 1
        }
        highestIndex -= 1
    }
    print("output: \(output)")
    return output
}

//Not recommend this approach
func makeSquaresStartFromZero(input: [Int]) -> [Int] {
    var output: [Int] = Array(repeating: 0, count: input.count)
    let startPoint = input.distance(from: input[0], to: 0)
    
    var leftIndex = startPoint - 1
    var rightIndex = startPoint
    var lowestIndex = 0
    
    while leftIndex >= 0 && rightIndex < input.count {
        let leftItem = input[leftIndex] * input[leftIndex]
        let rightItem = input[rightIndex] * input[rightIndex]
        if leftItem > rightItem {
            output[lowestIndex] = rightItem
            rightIndex += 1
        }
        else {
            output[lowestIndex] = leftItem
            leftIndex -= 1
        }
        lowestIndex += 1
    }
    if rightIndex < input.count {
        for i in stride(from: rightIndex, to: input.count, by: 1) {
            output[lowestIndex] = input[i] * input[i]
            lowestIndex += 1
        }
    }
    else {
        for i in stride(from: leftIndex, through: 0, by: -1) {
            output[lowestIndex] = input[i] * input[i]
            lowestIndex += 1
        }
    }
    return output
}

func searchTriplets(input: [Int]) -> [[Int]] {
    var output: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count:0)
    let sortedArray = input.sorted()
    for start in stride(from: 0, to: sortedArray.count, by: 1) {
        let item = sortedArray[start]
        
        if start > 0, sortedArray[start] == sortedArray[start - 1] {
            print("continue: \(sortedArray[start]) \(sortedArray[start - 1])")
            continue
        }
        //Two Pointer
        //[-3, -2, -1, 0, 1, 1, 2]
        var pointStart = start + 1
        var pointEnd = sortedArray.count - 1
        let targetSum = item * -1
        while pointStart < pointEnd {
            let tempSum = sortedArray[pointStart] + sortedArray[pointEnd]
            if tempSum == targetSum {
                output.append(
                    [item, sortedArray[pointStart], sortedArray[pointEnd]]
                )
                pointStart += 1
                pointEnd -= 1
                while pointStart < pointEnd, sortedArray[pointStart] == sortedArray[pointStart - 1] {
                    pointStart += 1
                }
                while pointStart < pointEnd, sortedArray[pointEnd + 1] == sortedArray[pointEnd] {
                    pointEnd -= 1
                }
            }
            else if tempSum < targetSum {
                pointStart += 1
            }
            else {
                pointEnd -= 1
            }
        }
    }
    return output
}
