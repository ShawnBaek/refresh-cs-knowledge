//
//  BFS.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/22/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    
    init(key: T) {
        self.value = key
    }
}


func traverseBFS<T>(root: TreeNode<T>) -> [[T]]? {
    //result is array list
    var result: [[T]] = [[T]]()
    var queue: [TreeNode<T>] = [TreeNode<T>]()
    queue.append(root)
    while queue.count > 0 {
        let levelSize = queue.count
        var currentLevel = [T]()
        for _ in stride(from: 0, to: levelSize, by: 1) {
            let currentNode: TreeNode<T> = queue.remove(at: 0)
            currentLevel.append(currentNode.value)
            
            if let left = currentNode.left {
                queue.append(left)
            }
            if let right = currentNode.right {
                queue.append(right)
            }
        }
        result.append(currentLevel)
    }
    return result
}

func traverseBFSLowesetFirst<T>(root: TreeNode<T>) -> [[T]]? {
    var result: [[T]] = [[T]]()
    var queue: [TreeNode<T>] = [TreeNode<T>]()
    queue.append(root)
    while queue.count > 0 {
        let levelSize = queue.count
        var levelItems = [T]()
        for _ in stride(from: 0, to: levelSize, by: 1) {
            let currentNode = queue.remove(at: 0)
            levelItems.append(currentNode.value)
            if let left = currentNode.left {
                queue.append(left)
            }
            if let right = currentNode.right {
                queue.append(right)
            }
        }
        //MARK:- insert result at first
        result.insert(levelItems, at: 0)
    }

    return result
}

func traverseZigzag<T>(root: TreeNode<T>) -> [[T]]? {
    var result: [[T]] = [[T]]()
    var queue: [TreeNode<T>] = [TreeNode<T>]()
    queue.append(root)
    var level = 0
    while queue.count > 0 {
        let levelCount = queue.count
        var levelItems: [T] = [T]()
        let isLeftToRight = level % 2 == 0
        for _ in stride(from: 0, to: levelCount, by: 1) {
            let currentNode = queue.remove(at: 0)
            if isLeftToRight {
                levelItems.append(currentNode.value)
            }
            else {
                levelItems.insert(currentNode.value, at: 0)
            }
            if let left = currentNode.left {
                queue.append(left)
            }
            if let right = currentNode.right {
                queue.append(right)
            }
        }
        level += 1
        result.append(levelItems)
    }
    return result
}

