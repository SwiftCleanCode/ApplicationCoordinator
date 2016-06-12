//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: BaseDeepLinkCoordinator {
    
    var tabbarConfigurator: protocol<TabbarFlowInput, TabbarFlowOutput>
    var coordinatorFactory: CoordinatorFactory

    init(tabbarConfigurator: protocol<TabbarFlowInput, TabbarFlowOutput>,
         coordinatorFactory: CoordinatorFactory) {
        
        self.tabbarConfigurator = tabbarConfigurator
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarConfigurator.onViewDidLoad = runItemCoordinator()
        tabbarConfigurator.onItemFlowSelect = runItemCoordinator()
        tabbarConfigurator.onSettingsFlowSelect = runSettingsCoordinator()
    }
    
    override func proceedDeepLink(tree: CoordinatorTree) {
        start()
        switch tree.className {
            case "ItemCoordinator": tabbarConfigurator.selectTabAtIndex(0)
            case "SettingsCoordinator": tabbarConfigurator.selectTabAtIndex(1)
            default: break
        }
    }
    
    private func runItemCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinator = self.coordinatorFactory.createItemCoordinator(navController: navController)
                itemCoordinator.start()
                self.addDependancy(itemCoordinator)
            }
        }
    }
    
    private func runSettingsCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.createSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependancy(settingsCoordinator)
            }
        }
    }
}
