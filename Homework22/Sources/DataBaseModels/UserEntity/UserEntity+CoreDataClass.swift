//
//  UserEntity+CoreDataClass.swift
//  Homework22
//
//  Created by Михаил Латий on 24.09.2023.
//
//

import Foundation
import CoreData

public class UserEntity: NSManagedObject {
    
    static func create(name: String, birthDate: String?, gender: String?) -> UserEntity {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let userEntity = UserEntity(context: context)
        userEntity.name = name
        userEntity.birthDate = birthDate
        userEntity.gender = gender
        CoreDataManager.shared.saveContext()

        return userEntity
    }
    
    static func fetchAll() -> [UserEntity] {
        let fetchRequest = UserEntity.fetchRequest()
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let userEntities = try? context.fetch(fetchRequest)
        
        return userEntities ?? []
    }
    
    static func delete(_ user: UserEntity) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(user)
        
        CoreDataManager.shared.saveContext()
    }
    
    static func update(_ user: UserEntity?, name: String, birthDate: String?, gender: String?) {
        user?.name = name
        user?.birthDate = birthDate
        user? .gender = gender
        
        CoreDataManager.shared.saveContext()
    }
}
