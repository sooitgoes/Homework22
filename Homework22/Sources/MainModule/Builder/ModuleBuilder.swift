//
//  ModuleBuilder.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
}

