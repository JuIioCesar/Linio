//
//  ViewController.swift
//  Linio
//
//  Created by Jonathan Velazquez on 29/08/17.
//  Copyright © 2017 Jonathan Velazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let model = ViewModel()
    
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = .white
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

