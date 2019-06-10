//
//  main.swift
//  lesson6
//
//  Created by Serg on 02/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation
let start = Date()
var treeAVL = AVLTree<Int>()

for _ in 0..<1000000 {
    let random = Int.random(in: 0..<1000000)
    treeAVL.insert(random)
}

//treeAVL.root?.traverseInOrder() // - обход

let finish = Date()
let interval = finish.timeIntervalSince(start)
print(interval)
    if interval > 60 {
        let min = Int(interval/60)
    
        print("\(min) min \(Int((interval-Double((60*min))))) sec")
    }else if interval < 1 {
        print("\(Float(interval*1000)) msec")
    }else {
        print("\(Float(interval)) sec")
    }










