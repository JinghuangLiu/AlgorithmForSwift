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
        
        printInReverse(["刘","靖","煌"])
        
    }
    
    func stackSimpleDemo() {
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


}

