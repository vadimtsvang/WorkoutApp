//
//  CalendarCollectionViewCell.swift
//  Workout App
//
//  Created by Vadim on 07.10.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Su"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold16()
        return label
    }()
    
    private var numberOfDayLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "04"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold20()
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        addSubviews(dayOfWeekLabel, numberOfDayLabel)
    }
    
    public func dateForCell(numberOfDay: String, dayOfWeek: String) {
        
        dayOfWeekLabel.text = dayOfWeek
        numberOfDayLabel.text = numberOfDay
    }
}

//MARK: - Set Constraints

extension CalendarCollectionViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
