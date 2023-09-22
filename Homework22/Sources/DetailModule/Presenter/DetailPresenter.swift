//
//  DetailPresenter.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import Foundation

//MARK: - DetailViewProtocol
protocol DetailViewProtocol: AnyObject {
    func setUserData(_ userData: User?)
    
}

//MARK: - DetailPresenterProtocol
protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, userData: User?)
    func showUserData()
    func save(name: String?, birth: String?, gender: String?)
}

//MARK: - DetailPresenter
class DetailPresenter: DetailPresenterProtocol {

    
    weak var view: DetailViewProtocol?
    var userData: User?
    
    required init(view: DetailViewProtocol, userData: User?) {
        self.view = view
        self.userData = userData
    }
    
    func showUserData() {
        view?.setUserData(userData)
    }

    func save(name: String?, birth: String?, gender: String?) {
        userData?.name = name ?? ""
        userData?.birthDate = birth
        userData?.gender = gender
    }
}




