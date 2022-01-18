//
//  GDTableView.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 17.01.22.
//

import Foundation
import UIKit

class GDTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()
        backgroundColor = .clear
        separatorStyle = .none
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

