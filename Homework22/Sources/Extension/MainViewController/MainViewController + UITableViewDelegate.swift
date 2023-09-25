//
//  MainViewController + UITableViewDelegate.swift
//  Homework22
//
//  Created by Михаил Латий on 25.09.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = presenter?.users?[indexPath.row]
        let viewController = ModuleBuilder.createDetailModule(user: user)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
