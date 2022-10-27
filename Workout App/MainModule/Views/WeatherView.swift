//
//  WeatherView.swift
//  Workout App
//
//  Created by Vadim on 04.10.2022.
//

import UIKit

class WeatherView: UIView {
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Солнечно"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        return label
    }()
    
    let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
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
        addShadowOnView()
        backgroundColor = UIColor(named: "white")
        layer.cornerRadius = 10
        addSubviews(weatherLabel, weatherDiscriptionLabel, weatherImageView)
    }
}

extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.heightAnchor.constraint(equalToConstant: 21),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -10),
            
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -10),
            weatherDiscriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
