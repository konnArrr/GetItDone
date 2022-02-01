//
//  protocol.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 13.01.22.
//

import Foundation

protocol GDHeaderDelegate {
    func openAddItemPopUp()
}


protocol GDNewItemDelegate {
    func addItemToList(text: String)
}

protocol ListCellDelegate {
    func toogleToDo()
}
    
