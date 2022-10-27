//
//  StartedWorkoutViewController.swift
//  Workout App
//
//  Created by Vadim on 23.10.2022.
//

import UIKit

class StartedWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(text: "Start Workout".uppercased(), font: .robotoMedium24(), textColor: .specialGray)
    
    private lazy var progressImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "bar")
        image.toAutoLayout()
        return image
    }()
    
    private lazy var closeButton = CloseButton(type: .system)
    private let startedDetailsView = StartedDetailsView()
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

        view.addSubviews(startWorkoutLabel, progressImage, closeButton, startedDetailsView, finishButton)
    }
    
    @objc private func closeButtonTapped() {
        print("close")
    }
    
    @objc private func finishButtonTapped() {
        print("finish")
    }
}


//MARK: - Set Constraints

extension StartedWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            progressImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 25),
            progressImage.heightAnchor.constraint(equalToConstant: 250),
            progressImage.widthAnchor.constraint(equalToConstant: 250),
            
            startedDetailsView.topAnchor.constraint(equalTo: progressImage.bottomAnchor, constant: 25),
            startedDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startedDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            finishButton.topAnchor.constraint(equalTo: startedDetailsView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
