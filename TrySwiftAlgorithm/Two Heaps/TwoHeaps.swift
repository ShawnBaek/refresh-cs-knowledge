//
//  TwoHeaps.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/24/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation
class MedianOfStream {
    var maxHeap: [Int] = [Int]()
    var minHeap: [Int] = [Int]()
    //3, 1, 5, 4
    func insertNumber(input: Int) {
        if maxHeap.count == 0 || input <= (maxHeap.last ?? 0) {
            maxHeap.append(input)
        }
        else {
            minHeap.append(input)
        }
        maxHeap.sort { $0 < $1 }
        minHeap.sort { $0 > $1 }
        
        if maxHeap.count > minHeap.count + 1 {
            minHeap.append(maxHeap.removeLast())
        }
        else if minHeap.count > maxHeap.count {
            maxHeap.append(minHeap.removeLast())
        }
    }
    
    func findMedian() -> Double {
        if minHeap.count == maxHeap.count {
            return Double(minHeap.last! + maxHeap.last!) / 2.0
        }
        return Double(maxHeap.last!)
    }
}
