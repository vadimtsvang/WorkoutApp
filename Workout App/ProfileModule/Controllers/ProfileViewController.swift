//
//  ProfileViewController.swift
//  Workout App
//
//  Created by Vadim on 26.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileLabel = UILabel(text: "Profile".uppercased(), font: .robotoMedium24(), textColor: .specialGray)
    
    private let backView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let nameLabel = UILabel(text: "James Harden".uppercased(), font: .robotoBold24(), textColor: .white)

    private let heightLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .specialGray
        label.font = .robotoBold16()
        label.text = "Height: 180"
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .specialGray
        label.font = .robotoBold16()
        label.text = "Weight: 80"
        return label
    }()
    
    private var labelsStackView = UIStackView()
    
    private lazy var editButton: UIButton = {
        var button = UIButton()
        button.toAutoLayout()
//        button.tintColor = .specialGreen
        button.setTitleColor(.specialGreen, for: .normal)
        button.setTitle("Editing ", for: .normal)
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = .robotoBold16()
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -5.0, y: 1.0)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
//        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
//        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        
        labelsStackView = UIStackView(arrangedSubviews: [heightLabel, weightLabel], axis: .horizontal, spacing: 10)

        view.addSubviews(profileLabel, backView, userPhotoImageView, labelsStackView, editButton)
        backView.addSubview(nameLabel)
    }
    
    @objc private func editButtonTapped() {
        print("close")
    }
}

//MARK: - Set Constraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 60),
            backView.heightAnchor.constraint(equalToConstant: 110),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            userPhotoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 15),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15),
            nameLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            
            labelsStackView.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20),
            
            editButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}
