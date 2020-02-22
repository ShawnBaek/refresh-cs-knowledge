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


printTimeElapsedWhenRunningCode {
    print(longestSubStringWithOneAfterReplaceOptimization(input: [0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1], k: 2))
}

printTimeElapsedWhenRunningCode {
    print(longestSubStringWithOneAfterReplaceOptimization(input: [0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1], k: 3))
}

printTimeElapsedWhenRunningCode {
    pairWithTargetSum(input: [1, 2, 3, 4, 6], target: 6)
}

printTimeElapsedWhenRunningCode {
    pairWithTargetSum(input: [2, 5, 9, 11], target: 11)
}


printTimeElapsedWhenRunningCode {
    pairWithTargetSumUsingHashTable(input: [1, 2, 3, 4, 6], target: 6)
}

printTimeElapsedWhenRunningCode {
    pairWithTargetSumUsingHashTable(input: [2, 5, 9, 11], target: 11)
}

removeDuplicateSortedArray2(input: [2, 3, 3, 3, 6, 9, 9])
removeDuplicateSortedArray2(input: [2, 2, 2, 11])



removeDuplicateSortedArrayGivenKey(input: [3, 2, 3, 6, 3, 10, 9, 3], key: 3)

removeDuplicateSortedArrayGivenKey(input: [2, 11, 2, 2, 1], key: 2)


makeSquares(input: [-2, -1, 0, 2, 3])

makeSquaresStartFromZero(input: [-2, -1, 0, 2, 3])

makeSquaresStartFromZero(input: [-5, -4, -2, -1, 0, 2, 3])



print(searchTriplets(input: [-3, 0, 1, 2, -1, 1, -2]))

tripletCloseToTarget(input: [-2, 0, 1, 2], target: 2)

tripletCloseToTarget(input: [-3, -1, 1, 2], target: 1)
tripletCloseToTarget(input: [1, 0, 1, 1], target: 100)


let linkedList = LinkedList<Int>()

linkedList.append(element: 1)
linkedList.append(element: 2)
linkedList.append(element: 3)
linkedList.append(element: 4)
linkedList.append(element: 5)
linkedList.append(element: 6)

linkedList.printAllKeys()

let head = LLNode<Int>(element: 1)
head.next = LLNode<Int>(element: 2)
head.next?.next = LLNode<Int>(element: 3)
head.next?.next?.next = LLNode<Int>(element: 4)
head.next?.next?.next?.next = LLNode<Int>(element: 5)
head.next?.next?.next?.next?.next = LLNode<Int>(element: 6)

print("middle: \(middleNode(head: head)!.key!)")
print("has cycle: \(hasCycle(head: head))")

head.next?.next?.next?.next?.next?.next = head.next?.next
print("has cycle: \(hasCycle(head: head))")
print("cycle count: \(findCycleLength(head: head))")
print("cycle start node: \(findCycleStartNode(head: head)!.key!)")


head.next?.next?.next?.next?.next?.next = head.next?.next?.next
print("has cycle: \(hasCycle(head: head))")
print("cycle count: \(findCycleLength(head: head))")
print("cycle start node: \(findCycleStartNode(head: head)!.key!)")


head.next?.next?.next?.next?.next?.next = head
print("has cycle: \(hasCycle(head: head))")
print("cycle count: \(findCycleLength(head: head))")
print("cycle start node: \(findCycleStartNode(head: head)!.key!)")


print("find happy number: \(findHappyNumber(input: 23))")
print("find happy number: \(findHappyNumber(input: 12))")
print("find happy number: \(findHappyNumber(input: 10))")


print("merged intervals: \(mergeInterval(intervals: [[6, 7], [2, 4], [5, 9]]))")

print("merged intervals: \(mergeInterval(intervals: [[1, 4], [2, 6], [3, 5]]))")


print("merged intervals: \(mergeInterval(intervals: [[1, 3], [5, 7], [8, 12]], new: [4, 6]))")
print("merged intervals: \(mergeInterval(intervals: [[1, 3], [5, 7], [8, 12]], new: [4, 10]))")
print("merged intervals: \(mergeInterval(intervals: [[2, 3], [5, 7]], new: [1, 4]))")


print("intersaction intervals: \(intersectionInterval(arr1: [[1, 3], [5, 6], [7, 9], [2, 3]], arr2: [[2, 3], [5, 7]]))")

print("appointment: \(conflicting(appointment: [[1, 4], [2, 5], [7, 9]]))")

print("appointment: \(conflicting(appointment: [[6, 7], [2, 4], [8, 12]]))")
print("appointment: \(conflicting(appointment: [[4, 5], [2, 3], [3, 6]]))")


var cyclicSortInput1 = [3, 1, 5, 4, 2]
var cyclicSortInput2 = [2, 6, 4, 3, 1, 5]
var cyclicSortInput3 = [1, 5, 6, 4, 3, 2]
print("Cyclic Sort: \(cyclicSort(input: &cyclicSortInput1))")
print("Cyclic Sort: \(cyclicSort(input: &cyclicSortInput2))")
print("Cyclic Sort: \(cyclicSort(input: &cyclicSortInput3))")


var linkedHead = Node<Int>(key: 0)
linkedHead.next = Node<Int>(key: 1)
linkedHead.next?.next = Node<Int>(key: 2)
linkedHead.next?.next?.next = Node<Int>(key: 3)
linkedHead.next?.next?.next?.next = Node<Int>(key: 4)

var reverseHead = reverseLinkedList(head: linkedHead)

while reverseHead != nil {
    print("reverse: \(reverseHead?.key)")
    reverseHead = reverseHead?.next
}

var sublistTest = Node<Int>(key: 1)
sublistTest.next = Node<Int>(key: 2)
sublistTest.next?.next = Node<Int>(key: 3)
sublistTest.next?.next?.next = Node<Int>(key: 4)
sublistTest.next?.next?.next?.next = Node<Int>(key: 5)

var reverseSubListHead = reverseSubList(head: sublistTest, p: 2, q: 4)

while reverseSubListHead != nil {
    print("reverse sublist: \(reverseSubListHead?.key)")
    reverseSubListHead = reverseSubListHead?.next
}
