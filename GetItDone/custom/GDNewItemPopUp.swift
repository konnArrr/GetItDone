//
//  NewItemPopUp.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 13.01.22.
//

import Foundation
import UIKit

class GDNewItemPopUp: GDGradient {
    
    let cancelBut = GDButton(title: "  cancel  ", type: .roundedText, radius: 4)
    let addBut = GDButton(title: "  add  ", type: .roundedText, radius: 4)
    let textField = GDTextField(placeHolder: "get some stuff")
    
    var delegate: GDNewItemDelegate?
          
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.layer.cornerRadius = 14
        
        let inset: CGFloat = 12
        
        addSubview(cancelBut)
        cancelBut.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancelBut.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancelBut.heightAnchor.constraint(equalToConstant: 24).isActive = true
        cancelBut.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        
        addSubview(addBut)
        addBut.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        addBut.topAnchor.constraint(equalTo: cancelBut.topAnchor).isActive = true
        addBut.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addBut.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        textField.topAnchor.constraint(equalTo: addBut.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 28).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Button handler
    
    @objc func handleCancel() {
        textField.resignFirstResponder()
    }
    
    @objc func handleAdd() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
    
    
}
