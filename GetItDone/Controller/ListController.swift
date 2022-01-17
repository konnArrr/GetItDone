//
//  ListController.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 04.01.22.
//

import Foundation
import UIKit

class ListController: UIViewController, GDHeaderDelegate, GDNewItemDelegate {
    

    let header = GDHeaderView(title: "Stuff to get done", subTitle: "4 left")
    let popUp = GDNewItemPopUp()
    
    var keyboardHeight: CGFloat = 333
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(header)
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.delegate = self
        
        view.addSubview(popUp)
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popUp.textField.delegate = self
        popUp.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardSize =  keyboardFrame.cgRectValue.size
            keyboardHeight = keyboardSize.height
        }
    }
    
    // Delegate functions
    func openAddItemPopUp() {
        print("trying open add pop up")
    }
    
    func addItemToList(text: String) {
        print("try to add item with text: \(text)")
    }
    
}


extension ListController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
    
}
