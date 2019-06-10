//
//  BinaryNode.swift
//  lesson6
//
//  Created by Serg on 05/03/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

//    Традиционно, узлы АВЛ-дерева хранят не высоту, а разницу высот правого и левого поддеревьев (так называемый balance factor), которая может принимать только три значения -1, 0 и 1. (если это значение иное, то это говорит о несбалансированности дерева

import Foundation

class AVLNode<Element> {
    
    var value: Element
    
    var leftChild: AVLNode?
    
    var rightChild: AVLNode?
    
    // Измерение баланса. Чтобы сохранить бинарное дерево сбалансированным, вам понадобится способ измерить баланс дерева. Дерево AVL достигает этого с помощью свойства height в каждом узле. В древовидной структуре высота узла - это самое длинное расстояние от текущего узла до конечного узла
    
    var height = 0
    
    var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    var leftHeight: Int {
        return leftChild?.height ?? -1
    }
    
    var rightHeight: Int {
        return rightChild?.height ?? -1
    }
    
    init(value: Element) {
        
        self.value = value
        
    }
    
}

extension AVLNode: CustomStringConvertible {

    var description: String {
        return diagram(for: self)
    }

    func diagram(for node: AVLNode?,_ top: String = "",_ root: String = "",_ bottom: String = "") -> String {

        guard let node = node else {
            return root + "nil\n"
        }

        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }

            return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ") + root + "\(node.value)\n" + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")

        }

    }

extension AVLNode {
    
    func traverseInOrder() {
        leftChild?.traverseInOrder()
        print(value)
        rightChild?.traverseInOrder()
    }
    
//    func traverseInOrder(visit: (Element) -> Void) {
//        leftChild?.traverseInOrder(visit: visit)
//        visit(value)
//        rightChild?.traverseInOrder(visit: visit)
//    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
     func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}



