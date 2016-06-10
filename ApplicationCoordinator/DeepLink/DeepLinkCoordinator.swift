//
//  DeepLinkCoordinatorProtocol.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol DeepLinkCoordinator: Coordinator, Identifierable {
    
    func finish()
    func proceedDeepLink(tree: CoordinatorTree)
    func controllersClassNames() -> [String]
    
    var childCoordinators: [DeepLinkCoordinator] {get}
}

