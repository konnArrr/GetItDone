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
        view.layer.cornerRadius = 24
        return view
    }()
    
    let titleLabel = GDLabel(title: "GET IT DONE", size: 24, textAlign: .center)
    
    let infoLabel: GDLabel = {
        let label = GDLabel(title: "Welcome. Get it done is a todo list.\nA really dope to do list.", size: 14, textAlign: .center)
        label.numberOfLines = 2
        return label
    }()
    
    let nextButton = GDButton(title: "START WINNING", type: .roundedText)
    
    let copyrightLabel: GDLabel = {
        let label = GDLabel(title: "© 2022 | Kombinat Licht und Kultur", color: .greyOne, size: 14, textAlign: .center)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    
    @objc func handleNext() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn) {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { (_) in
                self.navigationController?.pushViewController(ListController(), animated: false)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        
        bg.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        bg.addSubview(infoLabel)
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        
        bg.addSubview(nextButton)
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60).isActive = true
        nextButton.addTarget(self, action: #selector(self.handleNext), for: [.touchUpInside, .touchUpOutside])
        
        
        view.addSubview(copyrightLabel)
        copyrightLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        
    }
    
    

    
}

