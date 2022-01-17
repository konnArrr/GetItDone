//
//  GDLabel.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 03.01.22.
//

import Foundation
import UIKit

class GDLabel: UILabel {
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String = "default text", color: UIColor = .white, size: CGFloat = 16, frame: CGRect = .zero, textAlign: NSTextAlignment = .left) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-Regular", size: size)
        self.textAlignment = textAlign
    }
}
