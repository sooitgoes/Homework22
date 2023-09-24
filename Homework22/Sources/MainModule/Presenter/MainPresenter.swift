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
    var users: [UserEntity]? { get set }
    func getUsers(_ userName: String)
    func delete(_ userIndex: Int)
}

// MARK: - MainPresenter
class MainPresenter: MainPresenterProtocol {
    var users: [UserEntity]?
    weak var view: MainViewProtocol?

    required init(view: MainViewProtocol) {
        self.view = view
        self.users = [UserEntity]()
    }

    func getUsers(_ userName: String) {
//        let newUser = User(name: userName, birthDate: nil, gender: nil)
//        users?.append(newUser)
        view?.addUser()
    }

    func delete(_ userIndex: Int) {
        users?.remove(at: userIndex)
    }
}
