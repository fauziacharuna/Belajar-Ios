//
//  ContactTableViewController.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 15/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit
import Foundation

class ContactTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionHeaderHeight: CGFloat = 25
    let cellReuseIdentifier = "cell"
    let cellCustom = "customCell"
//    var contacts = [ContactGroup]()
    var contacts: [ContactGroup] = []
    
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
        print("You tap cell \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func loadView() {
        super.loadView()
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
                                     self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
                                     self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                                     self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
            
        ])
        self.tableView = tableView
        
    }
    
    
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




//        let itemsA = [["name" : "Fauzi","role": "admin"],["name" : "Fauzi","role": "user"],["name" : "Fauzi","role": "user"]]
//        let itemsB = [["name" : "Achmad","role": "user"],["name" : "Achmad","role": "user"],["name" : "Achmad","role": "user"]]
//        let itemsC = [["name" : "Haruna","role": "user"],["name" : "Haruna","role": "user"],["name" : "Achmad","role": "user"]]
        
//        contacts = [ContactGroup(section:"A", items: itemsA),
//                    ContactGroup(section: "B", items: itemsB),
//                    ContactGroup(section: "C", items: itemsC)]
        

        self.title = "Contacts"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: cellCustom)
        self.view.addSubview(tableView)
        setupAutoLayout()
        
      
    }
    func addTapped(sender:UIBarButtonItem){
        print("Add trigger")
    }
    
    
    func setupAutoLayout() {
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
