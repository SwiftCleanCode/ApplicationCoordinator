//
//  Identifierable.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 09.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum EntityType { case Coordinator, Controller }

protocol Identifierable {
    func classIdentifier() -> String
    func classType() -> EntityType
}

extension Identifierable {
    func classIdentifier() -> String {
        return String(self)
    }
}

extension Identifierable where Self: UIViewController {
    func classType() -> EntityType {
        return .Controller
    }
}

extension Identifierable where Self: Coordinator {
    func classType() -> EntityType {
        return .Coordinator
    }
}