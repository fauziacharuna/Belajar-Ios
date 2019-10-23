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

    var langguage: [String] = ["steve", "Swift", "Python", "Ruby", "Golang", "JavaScript", "Objective-C", "Objective-C"]
    var status: [String] = ["admin", "user"]
//    var contacts: [Contact] = []
    var contactGroup = [String: Contact]()

    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown, UIColor.brown, UIColor.brown, UIColor.brown, UIColor.white]
    
    /// menentukan jumlah baris (count) dari item
    /// - Parameter tableView: <#tableView description#>
    /// - Parameter section: <#section description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return contactGroup.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Section"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    /// fungsi untuk layout manager untuk inflating cell ke dalam tableview
    /// - Parameter tableView: <#tableView description#>
    /// - Parameter indexPath: untuk menentukan jumlah baris dan kolom dari struct
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = self.tableView.dequeueReusableCell(withIdentifier: cellCustom, for: indexPath) as! ContactCell

        let imageCell = UIImage(named: "apple")

        cell.myCellLabel.text = self.contacts[indexPath.row].name
        cell.statusLabel.text = self.contacts[indexPath.row].role
        cell.myView.layer.cornerRadius = 20
        cell.myView.image = imageCell
        //        cell.myView.layer.cornerRadius=self.colors[indexPath.row]

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


    ///Fungsi untuk load selurunh instance

    override func viewDidLoad() {
        super.viewDidLoad()
        //section A
        var contacts: [Contact] = []
        contacts.append(Contact(name: "Steve Jobs Steve Jobs Steve Jobs Steve Jobs Steve Jobs Steve Jobs Steve Jobs", role: "admin"))
        contacts.append(Contact(name: "Jobs", role: "user"))
        contacts.append(Contact(name: "Bill", role: "admin"))
        contacts.append(Contact(name: "Roger", role: "user"))
        contacts.append(Contact(name: "Anne", role: "user"))
        contactGroup["Section A"] = contacts
        //section B
        var contacts2: [Contact] = []
        contacts2.append(Contact(name: "Steve", role: "admin"))
        contacts2.append(Contact(name: "Jobs", role: "user"))
        contacts2.append(Contact(name: "Bill", role: "admin"))
        contacts2.append(Contact(name: "Roger", role: "user"))
        contacts2.append(Contact(name: "Anne", role: "user"))
        contactGroup["Section B"] = contacts2
        //dictionary


        self.title = "Contacts"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: cellCustom)

        self.view.addSubview(tableView)
        setupAutoLayout()

    }
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return contactGroup.count
    //    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 1 {
//            return "Section b"
//        }
//        return "Section A"
//    }

//    func sortData() {
//    }

    /// setup ini
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
