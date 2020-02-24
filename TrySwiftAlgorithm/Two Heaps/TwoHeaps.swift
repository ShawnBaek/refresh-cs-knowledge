//
//  TwoHeaps.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/24/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation
protocol Heaptify {
    var array: [Int] { get set }
    var count: Int { get set }
    
    func getLeftChildIndex(at index: Int) -> Int
    func getRightChildIndex(at index: Int) -> Int
    func getParentIndex(at index: Int) -> Int
    
    func isEmpty() -> Bool
    func isFull() -> Bool
    func getElement(at index: Int) -> Int
    func getCount() -> Int
    func printAllNodes()
}

extension Heaptify {
    func getLeftChildIndex(at index: Int) -> Int {
        let leftIndex = 2 * index + 1
        if leftIndex >= count {
            return -1
        }
        return leftIndex
    }
    
    func getRightChildIndex(at index: Int) -> Int {
        let rightIndex = 2 * index + 2
        if rightIndex >= count {
            return -1
        }
        return rightIndex
    }
    
    func getParentIndex(at index: Int) -> Int {
        if index < 0 || index > count {
            return -1
        }
        return (index - 1) / 2
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func isFull() -> Bool {
        return count == array.count
    }
    
    func getElement(at index: Int) -> Int {
        return array[index]
    }
    func getCount() -> Int {
        return count
    }
    
    
    func printAllNodes() {
        print(array)
    }
}

class Heap: Heaptify {
    init(capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
    }
    
    let capacity: Int
    var array: [Int]
    var count = 0
    
    func insert(input: Int) {
        array[count] = input
        siftUp(at: count)
        count += 1
    }
    
    func swap(index1: Int, index2: Int) {
        array.swapAt(index1, index2)
    }
    
    func siftDown(at index: Int) {
        let leftIndex = getLeftChildIndex(at: index)
        let rightIndex = getRightChildIndex(at: index)
        var smallerIndex = -1
        if leftIndex != -1, rightIndex != -1 {
            smallerIndex = getElement(at: leftIndex) < getElement(at: rightIndex) ? leftIndex : rightIndex
        }
        else if leftIndex != -1 {
            smallerIndex = leftIndex
        }
        else if rightIndex != -1 {
            smallerIndex = rightIndex
        }
        if smallerIndex == -1 {
            return
        }
        if getElement(at: smallerIndex) < getElement(at: index) {
            swap(index1: smallerIndex, index2: index)
            siftDown(at: smallerIndex)
        }
    }
    
    func siftUp(at index: Int) {
        let parentIndex = getParentIndex(at: index)
        if parentIndex != -1, getElement(at: index) < getElement(at: parentIndex) {
            swap(index1: index, index2: parentIndex)
            siftUp(at: parentIndex)
        }
    }
    
    
}

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
