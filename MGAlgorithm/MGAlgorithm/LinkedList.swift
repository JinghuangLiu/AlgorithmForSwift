//
//  LinkedList.swift
//  MGAlgorithm
//
//  Created by 刘靖煌 on 2021/3/2.
//

import Foundation

/// 节点
public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value:Value, next:Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

/// 链表
public class LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    /// 往链表头加一个数值
    /// - Parameter value: 数值
    public func push(_ value:Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// 删掉表头的数据
    public func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /// 把数据加在链表尾
    /// - Parameter value: 数据
    public func append(_ value:Value) {
        ///如果是空的链表，直接加上
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    public func removeLast() -> Value?{
        ///如果是空链表，直接返回
        guard let head = head else {
            return nil
        }
        ///如果头节点没有next节点，直接删除头节点
        guard head.next != nil else {
            return pop()
        }
        ///
        var prev = head
        var current = head
        
        ///当current.next为nil时，current为最后一个节点
        while let next = current.next {
            prev = current
            current = next
        }
        ///
        prev.next = nil
        tail = prev
        return current.value
    }
    
    /// 查询索引为index下的节点，时间复杂度：O(n)
    /// - Parameter index: 索引
    /// - Returns: 节点
    public func node(at index:Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }

    /// 在某个节点后插入一个数值
    /// - Parameters:
    ///   - value: 数值
    ///   - node: 节点
    /// - Returns: 节点
    @discardableResult
    public func insert(_ value:Value, after node:Node<Value>) -> Node<Value> {
        
        // 2，如果选择的节点刚好是尾部节点，则直接插入尾部
        guard tail !== node else {
            append(value)
            return tail!
        }
        // 3
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /// 删除掉某个节点后的节点
    /// - Parameter node: 节点
    /// - Returns: 数据
    @discardableResult
    public func remove(after node:Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
