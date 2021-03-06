//
//  Queues.swift
//  MGAlgorithm
//
//  Created by 刘靖煌 on 2021/3/5.
//

import Foundation

/// 队列的协议
public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

/// 用数组实现队列
public class QueueArray<T>: Queue {
    private var array: [T] = []
    public init(){}
    
    @discardableResult
    public func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    @discardableResult
    public func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: Element? {
        array.first
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

//public class QueueLinkedList<T> : Queue {
//
//}


