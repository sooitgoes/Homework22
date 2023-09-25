//
//  DetailPresenter.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import Foundation

//MARK: - DetailViewProtocol
protocol DetailViewProtocol: AnyObject {
    func setUserData(_ user: UserEntity?)
}

//MARK: - DetailPresenterProtocol
protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, user: UserEntity?)
    func showUserData()
    func update(name: String, birthDate: String?, gender: String?)
}

//MARK: - DetailPresenter
class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var user: UserEntity?
    
    required init(view: DetailViewProtocol, user: UserEntity?) {
        self.view = view
        self.user = user
    }
    
    func showUserData() {
        view?.setUserData(user)
    }

    func update(name: String, birthDate: String?, gender: String?) {
        UserEntity.update(user, name: name, birthDate: birthDate, gender: gender)
    }
}




