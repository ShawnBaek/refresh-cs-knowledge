//
//  ReverseLinkedList.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/19/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

class Node<T> {
    var key: T
    var next: Node<T>?
    
    init(key: T) {
        self.key = key
    }
}

func reverseLinkedList<T>(head: Node<T>) -> Node<T>? {
    var next: Node<T>? = nil
    var current: Node<T>? = head
    var previous: Node<T>? = nil
    
    while current != nil {
        next = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    return previous
}
