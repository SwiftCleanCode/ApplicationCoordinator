//
//  CoordinatorFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func createItemCoordinator(navController navController: UINavigationController?) -> DeepLinkCoordinator
    func createItemCoordinator() -> DeepLinkCoordinator
    
    func createSettingsCoordinator() -> DeepLinkCoordinator
    func createSettingsCoordinator(navController navController: UINavigationController?) -> DeepLinkCoordinator
    
    func createItemCreationCoordinatorBox() ->
        (coordinator: DeepLinkCoordinator,
        configurator: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController?) ->
        (coordinator: DeepLinkCoordinator,
        configurator: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createAuthCoordinatorBox() ->
        (coordinator: DeepLinkCoordinator,
        configurator: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createAuthCoordinatorBox(navController navController: UINavigationController?) ->
        (coordinator: DeepLinkCoordinator,
        configurator: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?)
}