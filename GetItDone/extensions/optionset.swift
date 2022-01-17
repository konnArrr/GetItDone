//
//  optionset.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 12.01.22.
//

import Foundation


struct ButtonOptions: OptionSet {
    let rawValue: Int


    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon = ButtonOptions(rawValue: 1 << 1)
    
}
