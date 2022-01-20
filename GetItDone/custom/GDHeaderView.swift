//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 10.01.22.
//

import Foundation
import UIKit


class GDHeaderView: UIView {
    
    let bg = GDGradient()
    let titleLabel = GDLabel(size: 14)
    let subTitleLabel = GDLabel(size: 24)
    let addButton = GDButton(type: .squareIcon)
    
    var delegate: GDHeaderDelegate?
    
    init(frame: CGRect = .zero, title: String = "header title", subTitle: String = "header Subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.text = title
        subTitleLabel.text = subTitle
        setupLayout()
    }
    
    var itemsLeft: Int = 0 {
        didSet {
            subTitleLabel.text = "\(itemsLeft) left"
        }
    }
    
    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 13).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true

        
        addSubview(subTitleLabel)
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 16 - 14).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.openAddItemPopUp()
        }        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
