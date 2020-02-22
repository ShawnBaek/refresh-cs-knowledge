//
//  MergeIntervals.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/17/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

//Time Complexity O(NLogN)
func mergeInterval(intervals: [[Int]]) -> [[Int]] {
    if intervals.count < 2 {
        return intervals
    }
    var output: [[Int]] = [[Int]]()
    //O(logN)
    let sortedInterval = intervals.sorted { $0[0] < $1[0] }
    var start = sortedInterval[0][0]
    var end = sortedInterval[0][1]
    
    //O(N)
    for index in stride(from: 1, to: sortedInterval.count, by: 1) {
        let interval = intervals[index]
        //0: start, 1: end
        if interval[0] <= end { //overlapped
            end = max(interval[1], end)
        }
        else {
            output.append([start, end])
            start = interval[0]
            end = interval[1]
        }
    }
    //add last interval
    output.append([start, end])
    return output
}

func mergeInterval(intervals: [[Int]], new: [Int]) -> [[Int]] {
    if intervals.count + new.count < 2 {
        return intervals
    }
    var newInterval = new
    var output: [[Int]] = [[Int]]()
    var i = 0
    while i < intervals.count, intervals[i][1] < newInterval[0] {
        output.append(intervals[i])
        i += 1
    }
    while i < intervals.count, intervals[i][0] < newInterval[1] {
        newInterval[0] = min(intervals[i][0], newInterval[0])
        newInterval[1] = max(intervals[i][1], newInterval[1])
        i += 1
    }
    output.append(newInterval)
    
    while i < intervals.count {
        output.append(intervals[i])
        i += 1
    }
    return output
}

func intersectionInterval(arr1: [[Int]], arr2: [[Int]]) -> [[Int]] {
    var output: [[Int]] = [[Int]]()
    let arrA = arr1
    let arrB = arr2
    var i = 0
    var j = 0
    
    while i < arrA.count, j < arrB.count {
        //check overlapped
        let overlappedA = arrA[i][0] >= arrB[j][0] && arrA[i][0] <= arrB[j][1]
        let overlappedB = arrB[j][0] >= arrA[i][0] && arrB[j][0] <= arrA[i][1]
        
        if overlappedA || overlappedB {
            let start = max(arrA[i][0], arrB[j][0])
            let end = min(arrA[i][1], arrB[j][1])
            output.append([start, end])
        }
        if arrA[i][1] < arrB[j][1] {
            i += 1
        }
        else {
            j += 1
        }
    }
    return output
}

func conflicting(appointment: [[Int]]) -> Bool {
    let sorted = appointment.sorted { $0[0] < $1[0] }
    var start = sorted[0][0]
    var end = sorted[0][1]
    var isOverlapped = true
    for index in stride(from: 1, to: sorted.count, by: 1) {
        if sorted[index][0] < end {
            isOverlapped = false
        }
        else {
            start = sorted[index][0]
            end = sorted[index][1]
        }
    }
    return isOverlapped
}
