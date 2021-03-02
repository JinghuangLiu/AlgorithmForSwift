//
//  Stack.swift
//  MGAlgorithm
//
//  Created by 刘靖煌 on 2021/3/2.
//

import Foundation

/// 栈：后进先出结构
public class Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(_ elments: [Element]) {
        storage = elments
    }
    
    public init(arrayLiteral elements:Element...) {
        storage = elements
    }
    
    /// 入栈
    /// - Parameter element: 元素
    public func push(_ element: Element) {
        storage.append(element)
    }
    
    /// 出栈
    /// - Returns: 栈顶元素
    public func pop() -> Element? {
        //removeLast()要求数组不为空，popLast()可以为空
        return storage.popLast()
    }
    
    /// 栈顶元素
    /// - Returns: 栈顶元素
    public func peek() -> Element?{
        return storage.last
    }
    
    /// 是否为空栈
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomStringConvertible {

    public var description: String {
        """
        ----top----
        \(storage.map{"\($0)"}.reversed().joined(separator: "\n"))
        ----end----
        """
    }
}
