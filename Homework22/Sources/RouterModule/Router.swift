//
//  Router.swift
//  Homework22
//
//  Created by Михаил Латий on 25.09.2023.
//

import UIKit

//MARK: - RouterMain
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: BuilderProtocol? { get set }
}

//MARK: - RouterProtocol
protocol RouterProtocol: RouterMain{
    func startViewController()
    func showDetail(user: UserEntity?)
    func popToRoot()
}

//MARK: - Router
class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: BuilderProtocol?

    init(navigationController: UINavigationController, moduleBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }

    func startViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = moduleBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetail(user: UserEntity?) {
        if let navigationController = navigationController {
            guard let detailViewController = moduleBuilder?.createDetailModule(user: user, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
