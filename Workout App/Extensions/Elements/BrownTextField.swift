//
//  BrownTextField.swift
//  Workout App
//
//  Created by Vadim on 14.10.2022.
//

import UIKit

protocol BrownTextFieldProtocol: AnyObject {
    func typing(range: NSRange, replacementString: String)
    func clear()
}

class BrownTextField: UITextField {
    
    weak var brownDelegate: BrownTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configire()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configire() {
        backgroundColor = .specialBrown
        borderStyle = .roundedRect
        layer.cornerRadius = 10
        textColor = .specialGray
        font = .robotoBold20()
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        toAutoLayout()
    }
}

extension BrownTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        brownDelegate?.typing(range: range, replacementString: string)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        brownDelegate?.clear()
        return true
    }
    
}
