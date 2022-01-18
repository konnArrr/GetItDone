//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 18.01.22.
//

import Foundation
import UIKit

class GDCheckBox: UIButton {
    
    var toogled: Bool? {
        didSet {
            if let toogled = toogled {
                if toogled {
                    backgroundColor = .green
                } else {
                    backgroundColor = .clear
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.greyZero.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
