//
//  MainPresenter.swift
//  Homework22
//
//  Created by Михаил Латий on 20.09.2023.
//

import Foundation

// MARK: - MainViewProtocol
protocol MainViewProtocol: AnyObject {
    func addUser()
}

// MARK: - MainPresenterProtocol
protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol)
    var users: [User]? { get set }
    func getUsers(userName: String)
}

// MARK: - MainPresenter
class MainPresenter: MainPresenterProtocol {
    var users: [User]?
    weak var view: MainViewProtocol?

    required init(view: MainViewProtocol) {
        self.view = view
        self.users = [User]()
    }

    func getUsers(userName: String) {
        let newUser = User(name: userName, birthDate: "29", gender: "muzh")
        users?.append(newUser)
        view?.addUser()
    }
}
