//
//  CreateContactViewController.swift
//  Belajar Ios
//
//  Created by Muhammad Rifqi Fatchurrahman on 23/11/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var roleField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    weak var delegate: CreateContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // selain pakai ibaction, bisa pakai target
        createBtn.addTarget(self, action: #selector(createDidTap), for: .touchUpInside)
    }
    
    @objc
    func createDidTap() {
        // cek teks tidak null & text bukan string kosong
        guard let name = nameField.text, !name.isEmpty else {
            alert(what: "Nama tidak boleh kosong")
            return
        }
        
        let role = roleField.text ?? "role tidak diketahui"  // elvis operator
        let contact = ContactModel(name: name, role: role)  // instantiate contact
        // delegasikan contact ke controller(yg implement protocol CreateContactDelegate) yg sudah di assign ke variable delegate
        delegate?.onContactCreated(contact: contact)
        // job selesai, dismiss controller
        dismiss(animated: true)
    }
    
    private func alert(what text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

/// Contact Creation Delegates
protocol CreateContactDelegate: class {
    func onContactCreated(contact: ContactModel)
}
