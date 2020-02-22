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

func reverseSubList<T>(head: Node<T>, start: Int, end: Int) -> Node<T>? {
    var sublist: Node<T>? = nil
    var current: Node<T>? = head
    var next: Node<T>? = nil
    var count = 0
    while current != nil, count <= end  {
        next = current?.next
        if count >= start {
            current?.next = sublist
            sublist = current
        }
        current = next
        count += 1
    }
    return sublist
}

func reverseSubList<T>(head: Node<T>, p: Int, q: Int) -> Node<T>? {
    if p == q {
        return head
    }
    var sublist: Node<T>? = head
    var previous: Node<T>? = nil
    var current: Node<T>? = head
    var count = 0
    while current != nil, count < p - 1 {
        previous = current
        current = current?.next
        count += 1
    }
    count = 0
    //previous: node at p - 1
    let lastNodeOfFirstPart = previous
    let lastNodeOfSublist = current
    var next: Node<T>? = nil
    previous?.next = nil
    
    //loop length of sublist between p and q
    while current != nil, count < q - p + 1 {
        next = current?.next
        current?.next = previous
        previous = current
        //reset next position of current node
        current = next
        count += 1
    }
    //node at p - 1
    if lastNodeOfFirstPart != nil {
        lastNodeOfFirstPart?.next = previous
    }
    else {
        sublist = previous
    }
    lastNodeOfSublist?.next = current
    
    return sublist
}

func reverseEveryKElement<T>(head: Node<T>, k: Int) -> Node<T>? {
    var newList: Node<T>? = head
    var current: Node<T>? = head
    var previous: Node<T>? = nil
    while true {
        var count = 0
        let lastNodeOfPrevious: Node<T>? = previous
        let lastOfSubList: Node<T>? = current
        var next: Node<T>? = nil
        while current != nil, count < k {
            next = current?.next
            current?.next = previous
            //reversed linked list
            previous = current
            current = next
            count += 1
        }
        
        if lastNodeOfPrevious != nil {
            lastNodeOfPrevious?.next = previous
        }
        else {
            //update new list
            newList = previous
        }
        //head -> next = start of next linked list
        lastOfSubList?.next = current
        if current == nil {
            break
        }
        previous = lastOfSubList
    }
    return newList
}
