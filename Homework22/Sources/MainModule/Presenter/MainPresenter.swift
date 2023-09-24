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
    func delete(_ user: UserEntity, userIndex: Int)
    func fetchUsers()
}

// MARK: - MainPresenter
class MainPresenter: MainPresenterProtocol {
    var users: [UserEntity]?
    weak var view: MainViewProtocol?

    required init(view: MainViewProtocol) {
        self.view = view
        self.users = [UserEntity]()
    }

    func fetchUsers() {
        users = UserEntity.fetchAll()
    }

    func getUsers(_ userName: String) {
        let user = UserEntity.create(name: userName, birthDate: nil, gender: nil)
        users?.append(user)
        view?.addUser()
    }

    func delete(_ user: UserEntity, userIndex: Int) {
        UserEntity.delete(user)
        users?.remove(at: userIndex)
    }
}
