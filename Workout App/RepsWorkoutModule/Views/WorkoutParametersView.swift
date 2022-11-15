//
//  WorkoutParametersView.swift
//  Workout App
//
//  Created by Vadim on 18.10.2022.
//

import UIKit

protocol NextSetProtocol: AnyObject {
    func nextSetTapped()
    func editingTapped()
}

class WorkoutParametersView: UIView {
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let backView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialBrown
        return view
    }()
    
    private let workoutNameLabel = UILabel(text: "Name", font: .robotoMedium24(), textColor: .specialGray)
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18(), textColor: .specialGray)
    private let numberOfSetsLabel = UILabel(text: "1/4", font: .robotoMedium24(), textColor: .specialGray)
    
    private let lineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private let repsLabel = UILabel(text: "Reps", font: .robotoMedium18(), textColor: .specialGray)
    private let numberOfRepsLabel = UILabel(text: "20", font: .robotoMedium24(), textColor: .specialGray)
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialLightBrown
        button.titleLabel?.font = .robotoMedium16()
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()

    private lazy var nextSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Set".uppercased(), for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.backgroundColor = .specialDarkYellow
        button.tintColor = .specialGray
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    
    weak var cellNextSetDelegate: NextSetProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        toAutoLayout()
        
        addSubviews(detailsLabel, backView, workoutNameLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberOfSetsLabel], axis: .horizontal, spacing: 10)
        repsStackView = UIStackView(arrangedSubviews: [repsLabel, numberOfRepsLabel], axis: .horizontal, spacing: 10)
        backView.addSubviews(setsStackView, lineView, repsStackView, secondLineView, editButton, nextSetButton)
    }
    
    @objc private func editButtonTapped() {
        cellNextSetDelegate?.editingTapped()
    }
    
    @objc private func nextSetButtonTapped() {
        cellNextSetDelegate?.nextSetTapped()
    }
    
    public func refreshLabels(model: WorkoutModel, numberOfSet: Int) {
        workoutNameLabel.text = model.workoutName
        numberOfSetsLabel.text = "\(numberOfSet)/\(model.workoutSets)"
        numberOfRepsLabel.text = "\(model.workoutReps)"
    }
}

extension WorkoutParametersView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            detailsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backView.heightAnchor.constraint(equalToConstant: 240),
            
            workoutNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            workoutNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            lineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 3),
            lineView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            lineView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            repsStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            secondLineView.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 3),
            secondLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            secondLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            
            editButton.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            nextSetButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
