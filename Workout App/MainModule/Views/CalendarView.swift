//
//  CalendarView.swift
//  Workout App
//
//  Created by Vadim on 04.10.2022.
//

import UIKit

class CalendarView: UIView {
    
    private let collectionView = CalendarCollectionView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        toAutoLayout()
        
        addSubview(collectionView)
    }
    
    public func setDelegate(_ delegate: CalendarViewProtocol?) {
        collectionView.calendarDelegate = delegate
    }
}

// MARK: - Set Constraints

extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

