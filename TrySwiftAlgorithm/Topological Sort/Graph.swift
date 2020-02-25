//
//  Graph.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/25/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

func topologicalSort(vertice: Int, edges: [[Int]]) -> [Int] {
    var sortedOrder: [Int] = [Int]()
    if vertice <= 0 {
        return sortedOrder
    }
    var inDegree: [Int: Int] = [:]
    var graph: [Int: [Int]] = [:]
    for i in 0..<vertice {
        inDegree[i] = 0
        graph[i] = [Int]()
    }
    
    for i in stride(from: 0, to: edges.count, by: 1) {
        let parent = edges[i][0]
        let child = edges[i][1]
        graph[parent]?.append(child)
        inDegree[child]? += 1
    }
    
    var sources: [Int] = [Int]()
    //Find all sources
    for i in stride(from: 0, to: inDegree.count, by: 1) {
        if inDegree[i] == 0 {
            sources.append(i)
        }
    }
    
    while sources.count > 0 {
        let vertex = sources.removeFirst()
        sortedOrder.append(vertex)
        if let childs = graph[vertex] {
            for child in childs {
                inDegree[child]? -= 1
                if inDegree[child] == 0 {
                    sources.append(child)
                }
            }
        }
    }
    //The graph has a cycle
    if sortedOrder.count != vertice {
        return []
    }
    return sortedOrder
}
