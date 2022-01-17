//
//  GDButton.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 04.01.22.
//

import Foundation
import UIKit

class GDButton : UIButton {
    
    var title: String
    var radius: CGFloat
    
    
    init(title: String = "button Text", frame: CGRect = .zero, type: ButtonOptions = .roundedText, radius: CGFloat = 20) {
        self.title = title
        self.radius = radius
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        phaseTwo(type: type)
    }
    
    func phaseTwo(type : ButtonOptions) {
        setTitle(title, for: .normal)
        setTitleColor(.greyZero, for: .normal)
        backgroundColor = .white
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
        }
        switch type {
        case .roundedText:
            self.roundedText()
        case .squareIcon:
            self.squareIcon()
        default:
            break
        }
    }
    
    
    
    func squareIcon() {
        // this is where we will set the custom icon
    }
    
    func roundedText() {
        layer.cornerRadius = radius
    }
    
//    func setCorner() {
//        print("\(frame.size.height)")
//        layer.cornerRadius = frame.size.height / 2
//    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
