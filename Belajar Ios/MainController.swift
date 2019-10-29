//
//  MainController.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 14/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import Foundation
import UIKit
class MainController : UIViewController {
    var counter : Int = 0
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        
    }
    
    @IBAction func nextContact(_ sender: Any) {
        let contactController = ContactTableViewController(nibName: "ContactTableViewController", bundle: nil)
     
        self.navigationController?.pushViewController(contactController, animated: true)
        
    }
    @IBAction func subtractFunction(_ sender: Any) {
        counter-=1
        numberLabel.text="\(counter)"
        print(counter)
    }
    
    @IBAction func addFunction(_ sender: Any) {
        counter+=1
        numberLabel.text = "\(counter)"
        print(counter)
    }
}
