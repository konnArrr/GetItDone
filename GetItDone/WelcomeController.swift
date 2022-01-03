//
//  ViewController.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 28.12.21.
//

import UIKit

class WelcomeController: UIViewController {
    
    
    let bg: UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        return view
    }()
    
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        bg.addSubview(titleLabel)
        titleLabel.text = "GET IT DONE"
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        
    }
    
    
}

