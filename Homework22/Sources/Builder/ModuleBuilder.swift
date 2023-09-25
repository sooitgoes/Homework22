//
//  ModuleBuilder.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import UIKit

//MARK: - BuilderProtocol
protocol BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(user: UserEntity?, router: RouterProtocol) -> UIViewController
}

//MARK: - ModuleBuilder
class ModuleBuilder: BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createDetailModule(user: UserEntity?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, user: user)
        view.presenter = presenter

        return view
    }
}

