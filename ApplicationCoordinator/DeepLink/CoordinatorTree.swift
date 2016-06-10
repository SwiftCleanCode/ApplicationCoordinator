//
//  TreeScheme.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

struct CoordinatorTree {
    let className: String
    let controllers: [String]? //class names
    var childCoordinators: [CoordinatorTree]?
}

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
}