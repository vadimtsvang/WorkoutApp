//
//  StartedDetailsView.swift
//  Workout App
//
//  Created by Vadim on 23.10.2022.
//

import UIKit

class StartedDetailsView: UIView {
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let backView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialBrown
        return view
    }()
    
    private let nameLabel = UILabel(text: "Squats", font: .robotoMedium24(), textColor: .specialGray)
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18(), textColor: .specialGray)
    private let setsResultLabel = UILabel(text: "1/4", font: .robotoMedium24(), textColor: .specialGray)
    
    private let lineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private let timeOfSetLabel = UILabel(text: "Time of Set", font: .robotoMedium18(), textColor: .specialGray)
    private let timeLabel = UILabel(text: "1 min 30 sec", font: .robotoMedium24(), textColor: .specialGray)
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.setTitleColor(.specialLightBrown, for: .normal)
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
        button.setTitleColor(.specialGray, for: .normal)
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    
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
        
        addSubviews(detailsLabel, backView, nameLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, setsResultLabel], axis: .horizontal, spacing: 10)
        repsStackView = UIStackView(arrangedSubviews: [timeOfSetLabel, timeLabel], axis: .horizontal, spacing: 10)
        backView.addSubviews(setsStackView, lineView, repsStackView, secondLineView, editButton, nextSetButton)
    }
    
    @objc private func editButtonTapped() {
        print("editButtonTapped")
    }
    
    @objc private func nextSetButtonTapped() {
        print("nextSetButtonTapped")
    }
}

extension StartedDetailsView {
    
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
            
            nameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            setsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
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
