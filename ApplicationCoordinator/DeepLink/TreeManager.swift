//
//  TreeManager.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 10.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class TreeManager {
    
    class func buildTree(coordinator: DeepLinkCoordinator) -> CoordinatorTree {
        
        var tree = CoordinatorTree(className: coordinator.classIdentifier(),
                                   controllers: coordinator.controllersClassNames(),
                                   childCoordinators: [])
        for child in coordinator.childCoordinators {
            let node = TreeManager.buildTree(child)
            tree.childCoordinators?.append(node)
        }
        return tree
    }
    
    class func compareTree(tree1: CoordinatorTree, withTree tree2: CoordinatorTree) {
        
    }
}