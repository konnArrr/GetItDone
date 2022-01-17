//
//  GDTextField.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 13.01.22.
//

import Foundation
import UIKit

class GDTextField: UITextField {
    
    var insets: UIEdgeInsets
    
    init(frame: CGRect = .zero, placeHolder: String = "placeholder", radius: CGFloat = 4, inset: CGFloat = 4) {
        self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        super.init(frame: frame)
        self.checkIfAutoLayout()
        
        self.placeholder = placeHolder
        backgroundColor = .white
        layer.cornerRadius = radius
        textColor = .greyZero
    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
