//
//  ContactTableViewController.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 15/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit
import Foundation

class ContactTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionHeaderHeight: CGFloat = 25
    let cellReuseIdentifier = "cell"
    let cellCustom = "customCell"
    var contacts: [ContactGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //section A
        var contact1: [ContactModel] = []
        contact1.append(ContactModel(name: "Achmad", role: "user"))
        contact1.append(ContactModel(name: "Achmad", role: "admin"))
        contact1.append(ContactModel(name: "Amin", role: "user"))
        let g1 = ContactGroup(section: "sectionA", items: contact1)
        contacts.append(g1)
        
        var contact2: [ContactModel] = []
        contact2.append(ContactModel(name: "Haruna", role: "user"))
        contact2.append(ContactModel(name: "Haruna", role: "admin"))
        contact2.append(ContactModel(name: "Haruna", role: "user"))
        let g2 = ContactGroup(section: "SectionB", items: contact2)
        contacts.append(g2)
        
        self.title = "Contacts"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: cellCustom)
    }
}

/// manfaatin extension untuk enkapsulasi kode
extension ContactTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.contacts[section].section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = self.tableView.dequeueReusableCell(withIdentifier: cellCustom, for: indexPath) as! ContactCell
        
        cell.myCellLabel?.text = contacts[indexPath.section].items[indexPath.row].name
        cell.statusLabel?.text = contacts[indexPath.section].items[indexPath.row].role
        
        let imageCell = UIImage(named: "apple")
        cell.myView.layer.cornerRadius = 20
        cell.myView.image = imageCell
        
        cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row at \(indexPath)")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
