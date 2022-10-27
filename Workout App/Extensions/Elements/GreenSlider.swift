//
//  GreenSlider.swift
//  Workout App
//
//  Created by Vadim on 14.10.2022.
//

import UIKit

class GreenSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configire()
    }
 
//    convenience init(minValue: Float, maxValue: Float) {
//        self.init(frame: .zero)
//        minimumValue = minValue
//        maximumValue = maxValue
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configire() {
        maximumTrackTintColor = .specialLightBrown
        minimumTrackTintColor = .specialGreen
        toAutoLayout()
    }
}
