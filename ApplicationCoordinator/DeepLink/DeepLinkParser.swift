//
//  DeepLinkParser.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

final class DeepLinkParser {
    
    class func proceed() -> CoordinatorTree {
        
        var tree = CoordinatorTree(className: "ApplicationCoordinator", controllers: [], childCoordinators: [])
        
        return [DeepLinkSeed(className: "ItemCoordinator", classType: .Coordinator),
                DeepLinkSeed(className: "ItemCreateCoordinator", classType: .Coordinator),
                DeepLinkSeed(className: "ItemCreateController", classType: .Controller)]
    }
}