//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class RouterImp: Router {
    
    private(set) weak var rootController: UINavigationController?
    private var presented: Int = 0 {
        didSet { if presented < 0 { presented = 0 }}
    }
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func present(controller: UIViewController?) {
        present(controller, animated: true)
    }
    func present(controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        
        presented = presented.successor()
        rootController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController?)  {
        push(controller, animated: true)
    }
    
    func push(controller: UIViewController?, animated: Bool)  {
        guard let controller = controller else { return }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController()  {
        popController(true)
    }
    
    func popController(animated: Bool)  {
        rootController?.popViewControllerAnimated(animated)
    }
    
    func popToRootController() {
        popToRootController(true)
    }
    
    func popToRootController(animated: Bool) {
        
        [0...presented].forEach {_ in
            dismissController(false)
        }
        rootController?.popToRootViewControllerAnimated(animated)
    }
    
    func popToController(controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        
        [0...presented].forEach {_ in
            dismissController(false)
        }
        rootController?.popToViewController(controller, animated: animated)
    }
    
    func dismissController() {
        dismissController(true)
    }
    
    func dismissController(animated: Bool) {
        presented = presented.predecessor()
        rootController?.dismissViewControllerAnimated(animated, completion: nil)
    }
}