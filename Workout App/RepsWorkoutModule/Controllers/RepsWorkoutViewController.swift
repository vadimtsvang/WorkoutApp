//
//  RepsWorkoutViewController.swift
//  Workout App
//
//  Created by Vadim on 18.10.2022.
//

import UIKit

class RepsWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel = UILabel(text: "Start Workout".uppercased(), font: .robotoMedium24(), textColor: .specialGray)
    
    private lazy var girlImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "girl")
        image.contentMode = .scaleAspectFit
        image.toAutoLayout()
        return image
    }()
    
    private lazy var closeButton = CloseButton(type: .system)
    private let workoutParametersView = WorkoutParametersView()
    private lazy var finishButton = GreenButton(text: "Finish".uppercased())
    
    private var workoutModel = WorkoutModel()
    private var numberOfSet = 1
    
    private let customAlert = CustomAlert()
   
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)

        view.addSubviews(newWorkoutLabel, girlImage, closeButton, workoutParametersView, finishButton)
        workoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
    }
    
    private func setDelegates() {
        workoutParametersView.cellNextSetDelegate = self
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
         dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
        } else {
            presentAlertWithActions(title: "Warning", message: "You Need to Finish Workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    public func setWorkoutModel(_ model: WorkoutModel) {
        workoutModel = model
    }
}

//MARK: - NextSetProtocol

extension RepsWorkoutViewController: NextSetProtocol {
    
    func editingTapped() {
        customAlert.presentCustomAlert(viewController: self, repsOrTimer: "Reps") { [weak self] sets, reps in
            guard let self = self else { return }
            if sets != "" && reps != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfReps = Int(reps) else { return }
                RealmManager.shared.updateSetsRepsWorkoutModel(model: self.workoutModel,
                                                               sets: numberOfSets,
                                                               reps: numberOfReps)
                self.workoutParametersView.refreshLabels(model: self.workoutModel, numberOfSet: self.numberOfSet)
            }
        }
    }

    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            workoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workout")
        }
    }
}

//MARK: - Set Constraints

extension RepsWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            girlImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            girlImage.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 25),
            girlImage.heightAnchor.constraint(equalToConstant: 250),
            girlImage.widthAnchor.constraint(equalToConstant: 190),
            
            workoutParametersView.topAnchor.constraint(equalTo: girlImage.bottomAnchor, constant: 25),
            workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
