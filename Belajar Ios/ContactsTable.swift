//
//  ContactsTable.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 29/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit

class ContactsTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
        @IBOutlet weak var tableView: UITableView!
        let cellCustom = "cellCustom"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = self.tableView.dequeueReusableCell(withIdentifier: cellCustom, for: indexPath) as! ContactCell
        return cell
            
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
         tableView.delegate = self
         tableView.dataSource = self
         tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: cellCustom)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
