//
//  ListController.swift
//  GetItDone
//
//  Created by Konstantin Schirmer on 04.01.22.
//

import Foundation
import UIKit

class ListController: UIViewController {
    
    let header = GDHeaderView(title: "Stuff to get done", subTitle: "4 left")
    
    let tableInset: CGFloat = 16
    
    lazy var bg: UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = tableInset
        return view
    }()
    
    let listTable = GDTableView()
    
    let CELL_ID = "cell_id"
    
    lazy var popUp = GDNewItemPopUp(radius: tableInset)
    
    var keyboardHeight: CGFloat = 333
  
    var listData = [ToDo]()
    func setData() {
        listData = [
            ToDo(id: 0, title: "eat cevapi", status: true),
            ToDo(id: 1, title: "go to museum", status: false),
            ToDo(id: 2, title: "buy tapas at the market", status: false),
            ToDo(id: 3, title: "walk up a mountain", status: true)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(header)
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.delegate = self
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tableInset).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tableInset).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -tableInset).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -tableInset).isActive = true
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID)
        
        view.addSubview(popUp)
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popUp.textField.delegate = self
        popUp.delegate = self
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
      
}

extension ListController: GDHeaderDelegate {
    
    func openAddItemPopUp() {
        print("trying open add pop up")
    }
    
}

extension ListController: GDNewItemDelegate {
    
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

extension ListController: ListCellDelegate {
    
    func toogleToDo(updatedToDo: ToDo) {
//        if let row = listData.firstIndex(where: {$0.id == id}) {
//            listData[row].status = status
//        }
        listData = listData.map({ toDo in
            if toDo.id == updatedToDo.id {
                return updatedToDo
            }
            return toDo
        })
        listTable.reloadData()
    }
}

extension ListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
        let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.height), height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        } else {
            titleForHeader.text = "Done"
        }
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        listData.forEach { toDoItem in
            if section == 0 && !toDoItem.status {
                count += 1
            } else if section == 1 && toDoItem.status {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? GDListCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        var itemsForSection: [ToDo] = []
        listData.forEach { toDoItem in
            if indexPath.section == 0 && !toDoItem.status {
                itemsForSection.append(toDoItem)
            } else if indexPath.section == 1 && toDoItem.status {
                itemsForSection.append(toDoItem)
            }
        }
        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }
}


extension ListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
}
