//
//  DeepLinkCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class BaseDeepLinkCoordinator: DeepLinkCoordinator {

    var childCoordinators: [DeepLinkCoordinator] = []
    
    func start() {
        assertionFailure("Must be overriden")
    }
    
    func finish() { }
    
    func proceedDeepLink(seed: [DeepLinkSeed]) {
        assertionFailure("Must be overriden")
    }
    
    func buildTree() -> CoordinatorTree {
        
        var tree = CoordinatorTree(className: classIdentifier(),
                                   controllers: controllersClassNames(),
                                   childCoordinators: [])
        for child in childCoordinators {
            tree.childCoordinators?.append(child.buildTree())
        }
        return tree
    }
    
    func controllersClassNames() -> [String] {
        return []
    }
    
    // add only unique object
    func addDependancy(coordinator: DeepLinkCoordinator) {
        
        for element in childCoordinators {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: DeepLinkCoordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}
