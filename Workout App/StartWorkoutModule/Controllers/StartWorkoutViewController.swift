//
//  StartWorkoutViewController.swift
//  Workout App
//
//  Created by Vadim on 18.10.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(text: "Start Workout".uppercased(), font: .robotoMedium24(), textColor: .specialGray)
    
    private lazy var girlImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "girl")
        image.toAutoLayout()
        return image
    }()
    
    private lazy var closeButton = CloseButton(type: .system)
    private let detailsView = DetailsView()
    private lazy var finishButton = GreenButton(text: "Finish".uppercased())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)

        view.addSubviews(startWorkoutLabel, girlImage, closeButton, detailsView, finishButton)
    }
    
    @objc private func closeButtonTapped() {
        print("close")
    }
    
    @objc private func finishButtonTapped() {
        print("finish")
    }
}


//MARK: - Set Constraints

extension StartWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            girlImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            girlImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 25),
            girlImage.heightAnchor.constraint(equalToConstant: 250),
            girlImage.widthAnchor.constraint(equalToConstant: 190),
            
            detailsView.topAnchor.constraint(equalTo: girlImage.bottomAnchor, constant: 25),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            finishButton.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
