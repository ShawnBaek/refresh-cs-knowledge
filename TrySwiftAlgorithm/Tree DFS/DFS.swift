//
//  DFS.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/23/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation
func hasPath<T>(root: TreeNode<T>?, sum: Int) -> Bool {
    guard root != nil, let rootValue = root?.value as? Int else {
        return false
    }
    //if the current node is a leaf and its value is equal to the sum, we've found a path
    if rootValue == sum, root?.left == nil, root?.right == nil {
        return true
    }
    if let leftChild = root?.left,
        hasPath(root: leftChild, sum: sum - rootValue) {
        return true
    }
    
    if let rightChild = root?.right,
        hasPath(root: rightChild, sum: sum - rootValue) {
        return true
    }
    return false
}

func findAllPath<T>(root: TreeNode<T>?, sum: Int) -> [[Int]]? {
    var currentPath: [Int] = [Int]()
    var allPath: [[Int]] = [[Int]]()
    findPathes(root: root, sum: sum, currentPath: &currentPath, allPath: &allPath)
    return allPath
}

func findPathes<T>(
    root: TreeNode<T>?,
    sum: Int,
    currentPath: inout [Int],
    allPath: inout [[Int]]
) {
    guard root != nil, let rootValue = root?.value as? Int else {
        return
    }
    currentPath.append(rootValue)
    //check leaf node
    if rootValue == sum, root?.left == nil, root?.right == nil {
        allPath.append(currentPath)
    }
    else {
        findPathes(root: root?.left, sum: sum - rootValue, currentPath: &currentPath, allPath: &allPath)
        findPathes(root: root?.right, sum: sum - rootValue, currentPath: &currentPath, allPath: &allPath)
    }
    _ = currentPath.popLast()
}

func sumOfPathNumber<T>(root: TreeNode<T>?) -> Int {
    var sumOfCurrentPath: [Int] = [Int]()
    var totalSum: Int = 0
    recursiveSumOfPathNumber(root: root, sumOfCurrentPath: &sumOfCurrentPath, totalNumber: &totalSum)
    return totalSum
}

func recursiveSumOfPathNumber<T>(root: TreeNode<T>?, sumOfCurrentPath: inout [Int], totalNumber: inout Int) {
    guard root != nil, let rootValue = root?.value as? Int else {
        return
    }
    sumOfCurrentPath.append(rootValue)
    //leaf node
    if root?.left == nil, root?.right == nil {
        var sum = 0
        for (index, value) in sumOfCurrentPath.enumerated() {
            let base = sumOfCurrentPath.count - index - 1
            let number = Int(pow(Double(10), Double(base))) * value
            sum += number
        }
        totalNumber += sum
    }
    else {
        if let leftChild = root?.left {
            recursiveSumOfPathNumber(root: leftChild, sumOfCurrentPath: &sumOfCurrentPath, totalNumber: &totalNumber)
        }
        if let rightChild = root?.right {
            recursiveSumOfPathNumber(root: rightChild, sumOfCurrentPath: &sumOfCurrentPath, totalNumber: &totalNumber)
        }
    }
    //Finish Current Path
    //Pop Left Node
    let _ = sumOfCurrentPath.popLast()
}


func sumOfPathNumber2<T>(root: TreeNode<T>?) -> Int {
    return recursiveSumOfPathNumber2(root: root, totalNumber: 0)
}

func recursiveSumOfPathNumber2<T>(root: TreeNode<T>?, totalNumber: Int) -> Int {
    guard root != nil, let rootValue = root?.value as? Int else {
        return 0
    }
    let pathSum = totalNumber * 10 + rootValue
    //left node
    if root?.left == nil, root?.right == nil {
        return pathSum
    }
    return recursiveSumOfPathNumber2(root: root?.left, totalNumber: pathSum) +
        recursiveSumOfPathNumber2(root: root?.right, totalNumber: pathSum)
}

//[1, 7, 9]
func findGivenPath<T>(root: TreeNode<T>?, given path: [Int]) -> Bool {
    return recursiveFindGivenPath(root: root, given: path, index: 0)
}

func recursiveFindGivenPath<T>(root: TreeNode<T>?, given path: [Int], index: Int) -> Bool {
    guard root != nil, let rootValue = root?.value as? Int else {
        return false
    }
    guard index < path.count else {
        return false
    }
    if rootValue != path[index] {
        return false
    }
    //Leaf Node is equal to given path..
    if root?.left == nil, root?.right == nil, index == path.count - 1 {
        return true
    }
    let leftChildResult = recursiveFindGivenPath(root: root?.left, given: path, index: index + 1)
    let rightChildResult = recursiveFindGivenPath(root: root?.right, given: path, index: index + 1)
    return leftChildResult || rightChildResult
}
