//
//  ViewController.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 14/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    deinit {
        
    }

    func fn(TheX x: Int, _ y: Int) {
    }
    
    

    @IBAction func onClick(_ sender: Any) {
        let testController = MainController(nibName: "MainController", bundle: nil)
        let navigation = UINavigationController(rootViewController:testController )

       navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
}

