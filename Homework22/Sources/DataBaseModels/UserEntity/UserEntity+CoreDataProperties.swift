//
//  UserEntity+CoreDataProperties.swift
//  Homework22
//
//  Created by Михаил Латий on 24.09.2023.
//
//

import Foundation
import CoreData

extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var gender: String?
}

extension UserEntity : Identifiable {

}
