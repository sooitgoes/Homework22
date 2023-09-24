//
//  DetailPresenter.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import Foundation

//MARK: - DetailViewProtocol
protocol DetailViewProtocol: AnyObject {
    func setUserData(_ userData: UserEntity?)
}

//MARK: - DetailPresenterProtocol
protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, userData: UserEntity?)
    func showUserData()
    func update(name: String, birthDate: String?, gender: String?)
}

//MARK: - DetailPresenter
class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var userData: UserEntity?
    
    required init(view: DetailViewProtocol, userData: UserEntity?) {
        self.view = view
        self.userData = userData
    }
    
    func showUserData() {
        view?.setUserData(userData)
    }

    func update(name: String, birthDate: String?, gender: String?) {
        UserEntity.update(userData, name: name, birthDate: birthDate, gender: gender)
    }
}




