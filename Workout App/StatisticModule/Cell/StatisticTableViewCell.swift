//
//  StatisticTableViewCell.swift
//  Workout App
//
//  Created by Vadim on 07.10.2022.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel(text: "Biceps", font: .robotoMedium24(), textColor: .specialGray)
    private let beforeLabel = UILabel(text: "Before: 18")
    private let nowLabel = UILabel(text: "Now: 20")
    private let differenceLabel = UILabel(text: "+2", font: .robotoMedium24(), textColor: .specialGreen)
    
    private let lineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private var labelsStackView = UIStackView()
        
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
        
        addSubview(nameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [beforeLabel, nowLabel], axis: .horizontal, spacing: 10)
        addSubviews(labelsStackView, differenceLabel, lineView)
    }
    
    public func configure(differenceWorkout: DifferenceWorkout) {
        nameLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        differenceLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: differenceLabel.textColor = .red
        case 1...: differenceLabel.textColor = .specialGreen
        default: differenceLabel.textColor = .specialGray
        }
    }
}

extension StatisticTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: differenceLabel.leadingAnchor, constant: -20),
            
            labelsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.widthAnchor.constraint(equalToConstant: 50),
            
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
