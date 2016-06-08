//
//  DeepLinkCoordinatorProtocol.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol DeepLink {
    
    func forceController()
    func close()
}

typealias DeepLinkCoordinatorType = protocol<Coordinator, DeepLink>