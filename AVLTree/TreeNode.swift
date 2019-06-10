//
//  TreeNode.swift
//  lesson6
//
//  Created by Serg on 03/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    
    func add(_ child: TreeNode) {
        children.append(child)
    }
    init(_ value: T) {
        self.value = value
    }
}

// Depth - virst traversal - метод обхода по глубене

extension TreeNode {
    func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}



