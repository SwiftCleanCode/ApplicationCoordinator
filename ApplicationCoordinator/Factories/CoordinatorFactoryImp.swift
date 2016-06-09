//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func createItemCoordinator() -> DeepLinkCoordinator {
        return createItemCoordinator(navController: nil)
    }
    
    func createItemCoordinator(navController navController: UINavigationController?) -> DeepLinkCoordinator {
        let coordinator = ItemCoordinator(router: router(navController),
                                          factory: ItemControllersFactoryImp(),
                                          coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func createSettingsCoordinator() -> DeepLinkCoordinator {
        return createSettingsCoordinator(navController: nil)
    }
    
    func createSettingsCoordinator(navController navController: UINavigationController? = nil) -> DeepLinkCoordinator {
        let coordinator = SettingsCoordinator(router: router(navController),
                                              factory: SettingsControllersFactoryImp())
        return coordinator
    }
    
    func createItemCreationCoordinatorBox() ->
        (coordinator: DeepLinkCoordinator,
        configurator: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            return createItemCreationCoordinatorBox(navController: nil)
    }
    func createItemCreationCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (coordinator: DeepLinkCoordinator,
        configurator: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            let router = self.router(navController)
            let coordinator = ItemCreateCoordinator(router: router,
                                                    factory: ItemCreateControllersFactoryImp())
            return (coordinator, coordinator, router.rootController)
    }
    
    func createAuthCoordinatorBox() ->
        (coordinator: DeepLinkCoordinator,
        configurator: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            
            return createAuthCoordinatorBox(navController: nil)
    }
    
    func createAuthCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (coordinator: DeepLinkCoordinator,
        configurator: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            let router = self.router(navController)
            let coordinator = AuthCoordinator(router: router,
                                              factory: AuthControllersFactoryImp())
            return (coordinator, coordinator, router.rootController)
    }
    
    private func router(navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController.controllerFromStoryboard(.Main)
        }
    }
}