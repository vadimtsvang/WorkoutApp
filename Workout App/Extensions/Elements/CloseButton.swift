//
//  CloseButton.swift
//  Workout App
//
//  Created by Vadim on 14.10.2022.
//

import UIKit


class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configire()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configire() {
        setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        toAutoLayout()
    }
}
