//
//  DeepLinkParser.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

/*
 ApplicationCoordinator
 ItemCoordinator
 ItemsListController
 ItemCreateCoordinator
 ItemCreateController
 */

import Foundation

final class DeepLinkParser {
    //mock
    class func proceed() -> CoordinatorTree {
        
        let child = CoordinatorTree(className: "ItemCreateCoordinator",
                                    controllers: ["ItemCreateController"],
                                    childCoordinators: [])
        
        let node = CoordinatorTree(className: "ItemCoordinator",
                                   controllers: ["ItemListController"],
                                   childCoordinators: [child])
        
        let tree = CoordinatorTree(className: "ApplicationCoordinator",
                                   controllers: [],
                                   childCoordinators: [node])
        return tree
    }
}