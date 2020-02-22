//
//  CyclicSort.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/18/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

//Input is 1...n
func cyclicSort(input: inout [Int]) -> [Int] {
    for i in stride(from: 0, to: input.count, by: 1) {
        var startIndex = i + 1
        while input[i] != i + 1 {
            input.swapAt(i, startIndex)
            startIndex += 1
        }
    }
    return input
}


func cyclicSort2(input: inout [Int]) -> [Int] {
    var i = 0
    while i < input.count {
        let j = input[i] - 1
        if input[i] != input[j] {
            input.swapAt(i, j)
        }
        else {
            i += 1
        }
    }
    return input
}

func findMissingNumber(input: [Int]) -> Int {
    return 0
}
