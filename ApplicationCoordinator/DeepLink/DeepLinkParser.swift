//
//  DeepLinkParser.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 08.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

struct DeepLinkSeed {
    let className: String
    let classType: EntityType
}

final class DeepLinkParser {
    
    class func proceed() -> [DeepLinkSeed] {
        
        return [DeepLinkSeed(className: "ItemCoordinator", classType: .Coordinator),
                DeepLinkSeed(className: "ItemCreateCoordinator", classType: .Coordinator),
                DeepLinkSeed(className: "ItemCreateController", classType: .Controller)]
    }
}