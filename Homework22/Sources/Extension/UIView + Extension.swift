//
//  UIView + Extension.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import UIKit

extension UIView {

    func addSubViews(views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
