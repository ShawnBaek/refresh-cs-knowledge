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
            return Int.min
        }
        return leftIndex
    }
    
    func getRightChildIndex(at index: Int) -> Int {
        let rightIndex = 2 * index + 2
        if rightIndex >= count {
            return Int.min
        }
        return rightIndex
    }
    
    func getParentIndex(at index: Int) -> Int {
        if index < 0 || index > count {
            return Int.min
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
    enum HeapType{
        case minHeap
        case maxHeap
    }
    
    init(capacity: Int, type: HeapType) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
        self.type = type
    }
    
    let type: HeapType
    let capacity: Int
    var array: [Int]
    var count = 0
    
    func insert(input: Int) {
        array[count] = input
        siftUp(at: count)
        count += 1
    }
    func getHighestPriority() -> Int {
        return array.first ?? Int.min
    }
    
    func remove(element: Int) {
        let toBeRemovedIndex = array.firstIndex(of: element) ?? Int.min
        guard toBeRemovedIndex != Int.min else {
            return
        }
        array[toBeRemovedIndex] = array[count - 1]
        array[count - 1] = 0
        count -= 1
        //sift down or sift up
        siftDown(at: toBeRemovedIndex)
    }
    
    func removeHighestPriority() -> Int {
        let min = getHighestPriority()
        array[0] = array[count - 1]
        array[count - 1] = 0
        count -= 1
        siftDown(at: 0)
        return min
    }
    
    func swap(index1: Int, index2: Int) {
        array.swapAt(index1, index2)
    }
    
    func siftDown(at index: Int) {
        let leftIndex = getLeftChildIndex(at: index)
        let rightIndex = getRightChildIndex(at: index)
        //Min Heap: SmallestIndex, Max Heap: BiggestIndex
        var targetIndex = Int.min
        if leftIndex != Int.min, rightIndex != Int.min {
            switch type {
            case .minHeap:
                targetIndex = getElement(at: leftIndex) < getElement(at: rightIndex) ? leftIndex : rightIndex
            case .maxHeap:
                targetIndex = getElement(at: leftIndex) > getElement(at: rightIndex) ? leftIndex : rightIndex
            }
            
        }
        else if leftIndex != Int.min {
            targetIndex = leftIndex
        }
        else if rightIndex != Int.min {
            targetIndex = rightIndex
        }
        if targetIndex == Int.min {
            return
        }
        var needSwap = false
        switch type {
        case .minHeap:
            needSwap = getElement(at: targetIndex) < getElement(at: index)
        case .maxHeap:
            needSwap = getElement(at: targetIndex) > getElement(at: index)
        }
        if needSwap {
            swap(index1: targetIndex, index2: index)
            siftDown(at: targetIndex)
        }
    }
    
    func siftUp(at index: Int) {
        let parentIndex = getParentIndex(at: index)
        var needSwap = false
        switch type {
        case .minHeap:
            needSwap = getElement(at: index) < getElement(at: parentIndex)
        case .maxHeap:
            needSwap = getElement(at: index) > getElement(at: parentIndex)
        }
        if parentIndex != Int.min, needSwap {
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
        if maxHeap.count == 0 || input <= (maxHeap.last!) {
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
//Input : [1, 2, -1, 3, 5] k=2, 3
class SlidingWindowMedian {
    var minHeap = Heap(capacity: 5, type: .minHeap)
    var maxHeap = Heap(capacity: 5, type: .maxHeap)
    var result: [Double] = Array(repeating: 0, count: 5)
    
    func rebalance() {
        if maxHeap.getCount() > minHeap.getCount() + 1 {
            if maxHeap.getHighestPriority() != Int.min {
                minHeap.insert(input: maxHeap.removeHighestPriority())
            }
        }
        else if minHeap.getCount() > maxHeap.getCount() {
            if minHeap.getHighestPriority() != Int.min {
                maxHeap.insert(input: minHeap.removeHighestPriority())
            }
        }
    }
    
    func findSlidingWindowMedian(numbers: [Int], k: Int) {
        result = Array(repeating: 0, count: 5)
        for i in stride(from: 0, to: numbers.count, by: 1) {
            if maxHeap.isEmpty() || numbers[i] < maxHeap.getHighestPriority() {
                maxHeap.insert(input: numbers[i])
            }
            else {
                minHeap.insert(input: numbers[i])
            }
            rebalance()
            
            //Check Sliding Window
            if i - k + 1 >= 0 {
                if minHeap.getCount() == maxHeap.getCount() {
                    result[i - k + 1] = Double(maxHeap.getHighestPriority() + minHeap.getHighestPriority()) / 2.0
                }
                else {
                    result[i - k + 1] = Double(maxHeap.getHighestPriority())
                }
                let elementToBeRemoved = numbers[i - k + 1]
                if elementToBeRemoved <= maxHeap.getHighestPriority() {
                    //delete from maxHeap
                    maxHeap.remove(element: elementToBeRemoved)
                }
                else {
                    //delete from minHeap
                    minHeap.remove(element: elementToBeRemoved)
                }
                rebalance()
            }
        }
        
    }
}
