//
//  DeepLinkCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class BaseDeepLinkCoordinator: DeepLinkCoordinatorType {

    var childCoordinators: [DeepLinkCoordinatorType] = []
    
    func start() {
        assertionFailure("")
    }
    
    func forceController() {
        
    }
    
    func close() {
        
    }
    
    // add only unique object
    func addDependancy(coordinator: DeepLinkCoordinatorType) {
        
        for element in childCoordinators {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: DeepLinkCoordinatorType) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}
