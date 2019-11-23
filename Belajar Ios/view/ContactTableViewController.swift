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
    let cellCustom = "customCell"
    var contacts: [ContactGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigation()
        
        self.title = "Contacts"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: cellCustom)
    }
    
    private func setupNavigation() {
        // tambah tombol di navigasi kanan
        let navItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContactDidTap))
        navigationItem.rightBarButtonItem = navItem
    }
    
    @objc
    func addContactDidTap() {
        let controller = CreateContactViewController(nibName: "CreateContactViewController", bundle: nil)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
}

/// manfaatin extension untuk enkapsulasi kode
extension ContactTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].items.count
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

/// implement protocol Delegate
extension ContactTableViewController: CreateContactDelegate {
    func onContactCreated(contact: ContactModel) {
        adaptData(contact)
        tableView.reloadData()
    }
    
    /// implement sort otomatis berdasarkan abjad
    private func adaptData(_ data: ContactModel) {
        guard let namePrefix = data.name?.first?.uppercased() else { return }
        
        print("adapting added data to list as sorted & grouped by prefix character")
        var added = false
        if !contacts.isEmpty {
            for i in 0..<contacts.count where namePrefix == contacts[i].section {
                contacts[i].items.append(data)
                // sort item inside section
                contacts[i].items.sort { ($0.name ?? "") < ($1.name ?? "") }
                added = true
            }
        }
        if !added {
            contacts.append(ContactGroup(section: namePrefix, items: [data]))
            // sort the section too
            contacts.sort { ($0.section) < ($1.section) }
        }
    }
}
