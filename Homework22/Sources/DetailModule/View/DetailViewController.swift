//
//  DetailViewController.swift
//  Homework22
//
//  Created by Михаил Латий on 21.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol?
    private var isEditMode = true

    // MARK: - UI Elements
    private lazy var nameTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var birthDayTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var genderTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var personIcon: UIImageView = {
        let icon = UIImage(systemName: "person")
        let imageView = UIImageView(image: icon)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var birthdayIcon: UIImageView = {
        let icon = UIImage(systemName: "person.2.circle")
        let imageView = UIImageView(image: icon)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var genderIcon: UIImageView = {
        let icon = UIImage(systemName: "calendar")
        let imageView = UIImageView(image: icon)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTextView, birthDayTextView, genderTextView])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNabBar()
        setupHierarchy()
        setupLayout()
        presenter?.showUserData()
    }

    // MARK: - Setup
    private func setupNabBar() {
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        navigationController?.navigationItem.setRightBarButton(barButton, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubViews(views: [stack, personIcon, birthdayIcon, genderIcon])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            nameTextView.heightAnchor.constraint(equalToConstant: 35),
            genderTextView.heightAnchor.constraint(equalToConstant: 35),
            birthDayTextView.heightAnchor.constraint(equalToConstant: 35),

            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 44),

            personIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            personIcon.rightAnchor.constraint(equalTo: stack.leftAnchor, constant: -5),
            personIcon.heightAnchor.constraint(equalToConstant: 25),
            personIcon.widthAnchor.constraint(equalToConstant: 25),

            birthdayIcon.topAnchor.constraint(equalTo: personIcon.bottomAnchor, constant: 25),
            birthdayIcon.rightAnchor.constraint(equalTo: stack.leftAnchor, constant: -5),
            birthdayIcon.heightAnchor.constraint(equalToConstant: 30),
            birthdayIcon.widthAnchor.constraint(equalToConstant: 30),

            genderIcon.topAnchor.constraint(equalTo: birthdayIcon.bottomAnchor, constant: 25),
            genderIcon.rightAnchor.constraint(equalTo: stack.leftAnchor, constant: -5),
            genderIcon.heightAnchor.constraint(equalToConstant: 30),
            genderIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    // MARK: - Action
    @objc func buttonPressed() {
        let name = nameTextView.text
        let birthDate = birthDayTextView.text
        let gender = genderTextView.text

        if isEditMode {
            presenter?.update(name: name ?? "", birthDate: birthDate, gender: gender)
            button.setTitle("Edit", for: .normal)
            nameTextView.isEditable = false
            birthDayTextView.isEditable = false
            genderTextView.isEditable = false
            isEditMode = false
        } else {
            button.setTitle("Save", for: .normal)
            nameTextView.isEditable = true
            birthDayTextView.isEditable = true
            genderTextView.isEditable = true
            isEditMode = true
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextView.resignFirstResponder()
        birthDayTextView.resignFirstResponder()
        genderTextView.resignFirstResponder()
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func setUserData(_ user: UserEntity?) {
        nameTextView.text = user?.name
        birthDayTextView.text = user?.birthDate
        genderTextView.text = user?.gender
    }
}

