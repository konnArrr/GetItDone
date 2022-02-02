//
//  GDListCell.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 18.01.22.
//

import Foundation
import UIKit

class GDListCell: UITableViewCell {
    
    
    var delegate: ListCellDelegate?
    
    @objc func toggleStatus() {        
        if let delegate = self.delegate, let toDo = self.toDo {
//            let newToDo = ToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
//            delegate.toogleToDo(updatedToDo: newToDo)
            CoreDataManager.shared.deleteToDo(id: toDo.id)
            CoreDataManager.shared.createToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
            delegate.toogleToDo()
        }
    }
    
    
    let textField = GDTextField(placeHolder: "todo", inset: 12)
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkBox = GDCheckBox()
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                checkBox.toogled = toDo.status                
                textField.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        let viewInset: CGFloat = 3
        contentView.addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: viewInset).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -viewInset).isActive = true
        view.backgroundColor = .white
        
        let textFieldInset: CGFloat = 3
        view.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: textFieldInset).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -textFieldInset).isActive = true
        
        textField.backgroundColor = .white
        
        addSubview(checkBox)
        checkBox.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 22).isActive = true
        checkBox.heightAnchor.constraint(equalTo: checkBox.widthAnchor).isActive = true
        
        checkBox.addTarget(self, action: #selector(toggleStatus), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
