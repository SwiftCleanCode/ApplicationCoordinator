//
//  BaseCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 28.04.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import Foundation
import UIKit
/*
protocol CoordinatorChildStorage {
    
    associatedtype T
    var childCoordinators: [T] {get set}
    
    func addDependancy(coordinator: T)
    func removeDependancy(coordinator: T)
}
class CoordinatorStorage<T: Coordinator> {
    
    var childCoordinators: [T] = []
    
    // add only unique object
    func addDependancy(coordinator: T) {
        
        for element in childCoordinators {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: T) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}
*/

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        assertionFailure("")
    }
    
    // add only unique object
    func addDependancy(coordinator: Coordinator) {
        
        for element in childCoordinators {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}