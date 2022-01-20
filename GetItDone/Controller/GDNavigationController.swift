//
//  GDNavigationController.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 20.01.22.
//

import Foundation
import UIKit

class GDNavigationController: UINavigationController {
      
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
    
}
