//
//  ModuleBuilder.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
    static func createDetailModule(user: User?) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        
        return view
    }

    static func createDetailModule(user: User?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, userData: user)
        view.presenter = presenter

        return view
    }
}

