//
//  MainViewController.swift
//  Homework22
//
//  Created by Михаил Латий on 20.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?

    // MARK: - UI Elements
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var nameTextField: UITextField = {
        let txfld = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 20))
        txfld.placeholder = "Print your name here"
        txfld.layer.cornerRadius = 10
        txfld.backgroundColor = .placeholderText
        txfld.leftView = paddingView
        txfld.leftViewMode = .always
        txfld.translatesAutoresizingMaskIntoConstraints = false
        return txfld
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupHierachy()
        setupLayout()
        presenter?.fetchUsers()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Setup
    private func setupNavBar() {
        title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierachy() {
        view.addSubViews(views: [nameTextField, button, tableView])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),

            button.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 44),

            tableView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    // MARK: - Action
    @objc func buttonPressed() {
        if !(nameTextField.text?.isEmpty ?? Bool()) {
            presenter?.getUsers(nameTextField.text ?? "")
            nameTextField.text = ""
        }
    }
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func addUser() {
        tableView.reloadData()
    }
}



