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