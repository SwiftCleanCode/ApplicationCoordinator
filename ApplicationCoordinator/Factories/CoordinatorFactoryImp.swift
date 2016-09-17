//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func createItemCoordinator() -> Coordinator {
        return createItemCoordinator(navController: nil)
    }
    
    func createItemCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = ItemCoordinator(router: router(navController),
                                          factory: ControllersFactoryImp(),
                                          coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func createSettingsCoordinator() -> Coordinator {
        return createSettingsCoordinator(navController: nil)
    }
    
    func createSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController),
                                              factory: ControllersFactoryImp())
        return coordinator
    }
    
    func createItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {
            
            return createItemCreationCoordinatorBox(navController: navigationController(nil))
    }
    func createItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {
            
            let router = self.router(navController)
            let coordinator = ItemCreateCoordinator(router: router,
                                                    factory: ControllersFactoryImp())
            return (coordinator, router)
    }
    
    func createAuthCoordinatorBox() ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: Presentable?) {
            return createAuthCoordinatorBox(navController: navigationController(nil))
    }
    
    func createAuthCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: Presentable?) {
            
            let router = self.router(navController)
            let coordinator = AuthCoordinator(router: router,
                                              factory: ControllersFactoryImp())
            return (coordinator, router)
    }
    
    fileprivate func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    fileprivate func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.Main) }
    }
}
