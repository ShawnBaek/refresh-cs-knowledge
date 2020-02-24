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

@discardableResult
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
    if rootValue == sum, root?.left == nil, root?.right == nil {
        allPath.append(currentPath)
    }
    else {
        findPathes(root: root?.left, sum: sum - rootValue, currentPath: &currentPath, allPath: &allPath)
        findPathes(root: root?.right, sum: sum - rootValue, currentPath: &currentPath, allPath: &allPath)
    }
    _ = currentPath.popLast()
}
