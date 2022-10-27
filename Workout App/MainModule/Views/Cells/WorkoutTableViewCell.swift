//
//  WorkoutTableViewCell.swift
//  Workout App
//
//  Created by Vadim on 07.10.2022.
//

import UIKit

protocol WorkoutCellProtocol: AnyObject {
    func startButtonTapped(model: WorkoutModel)
}

class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
        view.toAutoLayout()
        return view
    }()
    
    private let workoutBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.toAutoLayout()
        return view
    }()

    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let workoutNameLabel = UILabel(text: "Pull Ups", font: .robotoMedium24(), textColor: .specialBlack)
    private let workoutRepsLabel = UILabel(text: "Reps: 10", font: .robotoMedium16(), textColor: .specialGray)
    private let workoutSetsLabel = UILabel(text: "Sets: 2", font: .robotoMedium16(), textColor: .specialGray)
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        //button.backgroundColor = .specialYellow
        //button.tintColor = .specialDarkGreen
        //button.setTitle("START", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var labelsStackView = UIStackView()
    
    weak var workoutCellDelegate: WorkoutCellProtocol?
    
    private var workoutModel = WorkoutModel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        workoutBackgroundView.addSubview(workoutImageView)
        addSubview(workoutNameLabel)

        labelsStackView = UIStackView(arrangedSubviews: [workoutRepsLabel, workoutSetsLabel], axis: .horizontal, spacing: 10)
        
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
    }
    
    @objc private func startButtonTapped() {
        workoutCellDelegate?.startButtonTapped(model: workoutModel)
    }
    
    public func configure(model: WorkoutModel) {
        workoutModel = model
        
        workoutNameLabel.text = model.workoutName
        
        if model.workoutTimer == 0 {
            workoutRepsLabel.text = "Reps: \(model.workoutReps)"
        } else {
            workoutRepsLabel.text = "Timer: \(model.workoutTimer.getTimeFromSeconds())"
        }
        
        workoutSetsLabel.text = "Sets: \(model.workoutSets)"
        
        if model.workoutStatus {
            startButton.setTitle("Complete".uppercased(), for: .normal)
            startButton.tintColor = .white
            startButton.backgroundColor = .specialDarkGreen
            startButton.isEnabled = false
        } else {
            startButton.setTitle("Start".uppercased(), for: .normal)
            startButton.tintColor = .specialDarkGreen
            startButton.backgroundColor = .specialYellow
            startButton.isEnabled = true
        }
        
        guard let imageData = model.workoutImage,
              let image = UIImage(data: imageData) else { return }
        workoutImageView.image = image.withRenderingMode(.alwaysTemplate)
    }
}

extension WorkoutTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70),

            workoutImageView.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
            workoutImageView.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
            workoutImageView.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
            workoutImageView.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10),

            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),

            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20),

            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}