//
//  ViewController.swift
//  Example
//
//  Created by 刘靖煌 on 2021/3/2.
//

import UIKit
import MGAlgorithm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        stackDemo()
        
//        printInReverse(["刘","靖","煌"])
        
//        nodeDemo()
        
//        linkedListDemo()
        
//        queueDemo()
    }
    
    func stackDemo() {
        let stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.push(5)
        
        print(stack)
        
        if let popElement = stack.pop() {
            assert(5 == popElement)
            print("Pop element is : \(popElement)")
            print(stack)
        }
        
        stack.cleanStack()
        print(stack)
    }
    
    func printInReverse<T>(_ array: [T]) {
        let stack = Stack<T>()
        for value in array {
            stack.push(value)
        }
        while let value = stack.pop(){
            print(value)
        }
    }
    
    func nodeDemo() {
        let node1 = Node(value:1)
        let node2 = Node(value:2)
        let node3 = Node(value:3)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }

    func linkedListDemo() {
        
        let list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        list.append(4)
        list.append(5)
        list.append(6)
        
        print(list)
        
        print(list.node(at: 4)!)
        
        list.insert(-8, after: list.node(at: 4)!)
        print(list)
        
        list.pop()
        print(list)
        
        list.removeLast()
        print(list)
        
        list.remove(after: list.node(at: 1)!)
        print(list)
    }
    
    func queueDemo() {
        let queue = QueueArray<String>()
        
        queue.enqueue("liu")
        queue.enqueue("jing")
        queue.enqueue("huang")
        print(queue)
        
        queue.dequeue()
        print(queue)
        
    }

}

