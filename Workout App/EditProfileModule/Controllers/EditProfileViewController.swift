//
//  EditProfileViewController.swift
//  Workout App
//
//  Created by Vadim on 23.10.2022.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    private let editProfileLabel = UILabel(text: "Editing Profile".uppercased(), font: .robotoMedium24(), textColor: .specialGray)
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.backgroundColor = .specialLine
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 50
//        imageView.image = UIImage(named: "userImage")
        return imageView
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "userImage")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let nameView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let firstNameLabel = UILabel(text: "First name")
    private let secondNameLabel = UILabel(text: "Second name")
    private let heightLabel = UILabel(text: "Height")
    private let weightLabel = UILabel(text: "Weight")
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        return textField
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        return textField
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        return textField
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .specialBrown
        return textField
    }()
    
    private lazy var saveButton = GreenButton(text: "Save".uppercased())
    
//    override func viewWillLayoutSubviews() {
//        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        view.addSubviews(editProfileLabel, nameView, userPhotoImageView, firstNameLabel, secondNameLabel, heightLabel, weightLabel, firstNameTextField, secondNameTextField, heightTextField, weightTextField, saveButton, userImageView)
        
    }
    
    @objc private func saveButtonTapped() {
        print("saveButtonTapped")
    }
}

extension EditProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            editProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            editProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameView.topAnchor.constraint(equalTo: editProfileLabel.bottomAnchor, constant: 65),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameView.heightAnchor.constraint(equalToConstant: 68),
            
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.topAnchor.constraint(equalTo: editProfileLabel.bottomAnchor, constant: 14),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            userImageView.centerXAnchor.constraint(equalTo: userPhotoImageView.centerXAnchor),
            userImageView.centerYAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 45),
            userImageView.widthAnchor.constraint(equalToConstant: 45),
            
            firstNameLabel.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 40),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 0),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 15),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 0),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 15),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 0),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            heightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 15),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 0),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
