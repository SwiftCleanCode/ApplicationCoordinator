//
//  AppDelegate.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var applicationCoordinator: DeepLinkCoordinator = {
        let tabbarConfigurator = self.window!.rootViewController as! protocol<TabbarFlowInput, TabbarFlowOutput>
        return ApplicationCoordinator(tabbarConfigurator: tabbarConfigurator,
                                      coordinatorFactory: CoordinatorFactoryImp())
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if false {
            applicationCoordinator.start()
        } else {
            applicationCoordinator.proceedDeepLink(DeepLinkParser.proceed())
        }
        
        return true
    }
}

