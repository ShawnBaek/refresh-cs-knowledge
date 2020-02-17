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
